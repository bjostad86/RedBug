CREATE TABLE [dbo].[GlAccountMaster]
(
    [GlAccountId]        INT IDENTITY(1,1) NOT NULL,
    [AccountNumber]      NVARCHAR(30)      NOT NULL,   -- business key, e.g. 1010, 4000-100
    [AccountName]        NVARCHAR(200)     NOT NULL,
    [Description]        NVARCHAR(500)     NULL,

    -- Classification
    [AccountType]        NVARCHAR(20)      NOT NULL,   -- Asset, Liability, Equity, Revenue, Expense
    [AccountSubType]     NVARCHAR(50)      NULL,       -- e.g. Cash, Accounts Receivable, COGS
    [NormalBalance]      CHAR(1)           NOT NULL,   -- D = Debit, C = Credit
    [FinancialStatement] CHAR(2)           NOT NULL,   -- BS = Balance Sheet, IS = Income Statement

    -- Hierarchy
    [ParentGlAccountId]  INT               NULL,       -- self-reference for roll-ups
    [AccountLevel]       TINYINT           NOT NULL CONSTRAINT DF_GlAccountMaster_Level DEFAULT 1,
    [IsSummary]          BIT               NOT NULL CONSTRAINT DF_GlAccountMaster_IsSummary DEFAULT 0,  -- 1 = header, no direct posting

    -- Posting controls
    [AllowPosting]       BIT               NOT NULL CONSTRAINT DF_GlAccountMaster_AllowPosting DEFAULT 1,
    [AllowManualEntry]   BIT               NOT NULL CONSTRAINT DF_GlAccountMaster_AllowManual DEFAULT 1,
    [IsBankAccount]      BIT               NOT NULL CONSTRAINT DF_GlAccountMaster_IsBank DEFAULT 0,
    [IsControlAccount]   BIT               NOT NULL CONSTRAINT DF_GlAccountMaster_IsControl DEFAULT 0,  -- AR/AP/inventory control
    [RequiresDepartment] BIT               NOT NULL CONSTRAINT DF_GlAccountMaster_ReqDept DEFAULT 0,
    [CurrencyCode]       CHAR(3)           NOT NULL CONSTRAINT DF_GlAccountMaster_Currency DEFAULT 'USD',
    [TaxCode]            NVARCHAR(20)      NULL,

    -- Status / audit
    [Notes]              NVARCHAR(MAX)     NULL,
    [IsActive]           BIT               NOT NULL CONSTRAINT DF_GlAccountMaster_IsActive DEFAULT 1,
    [CreatedAt]          DATETIME2         NOT NULL CONSTRAINT DF_GlAccountMaster_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]          DATETIME2         NULL,

    CONSTRAINT PK_GlAccountMaster PRIMARY KEY (GlAccountId),
    CONSTRAINT UQ_GlAccountMaster_AccountNumber UNIQUE (AccountNumber),
    CONSTRAINT FK_GlAccountMaster_Parent FOREIGN KEY (ParentGlAccountId) REFERENCES dbo.GlAccountMaster (GlAccountId),
    CONSTRAINT CK_GlAccountMaster_Type CHECK (AccountType IN ('Asset', 'Liability', 'Equity', 'Revenue', 'Expense')),
    CONSTRAINT CK_GlAccountMaster_NormalBalance CHECK (NormalBalance IN ('D', 'C')),
    CONSTRAINT CK_GlAccountMaster_Statement CHECK (FinancialStatement IN ('BS', 'IS')),
    CONSTRAINT CK_GlAccountMaster_NoSelfParent CHECK (ParentGlAccountId IS NULL OR ParentGlAccountId <> GlAccountId),
    -- summary (header) accounts cannot be posted to
    CONSTRAINT CK_GlAccountMaster_SummaryNoPost CHECK (IsSummary = 0 OR AllowPosting = 0)
);

CREATE INDEX IX_GlAccountMaster_Parent ON dbo.GlAccountMaster (ParentGlAccountId) WHERE ParentGlAccountId IS NOT NULL;
CREATE INDEX IX_GlAccountMaster_Type   ON dbo.GlAccountMaster (AccountType, AccountNumber);