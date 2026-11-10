CREATE TABLE [dbo].[BankMaster]
(
    [BankId]                INT IDENTITY(1,1)   NOT NULL,
    [BankCode]              VARCHAR(20)         NOT NULL,   -- short business key, e.g. OPER-CHK
    [BankName]              VARCHAR(200)        NOT NULL,
    [BranchName]            VARCHAR(100)        NULL,

    -- Account details
    [AccountName]           VARCHAR(200)        NULL,       -- name on the account
    [AccountNumber]         VARCHAR(50)         NOT NULL,   -- sensitive: restrict access / consider encryption or masking
    [AccountType]           VARCHAR(20)         NOT NULL CONSTRAINT DF_BankMaster_AccountType DEFAULT 'Checking',
    [RoutingNumber]         VARCHAR(20)         NULL,       -- ABA routing number (US)
    [SwiftCode]             VARCHAR(11)         NULL,       -- BIC / SWIFT
    [Iban]                  VARCHAR(34)         NULL,
    [CurrencyCode]          CHAR(3)             NOT NULL CONSTRAINT DF_BankMaster_Currency DEFAULT 'USD',

    -- Bank contact
    [ContactName]           VARCHAR(100)        NULL,
    [Email]                 VARCHAR(255)        NULL,
    [Phone]                 VARCHAR(30)         NULL,

    -- Bank address
    [Address1]              VARCHAR(100)        NULL,
    [Address2]              VARCHAR(100)        NULL,
    [City]                  VARCHAR(100)        NULL,
    [State]                 VARCHAR(50)         NULL,
    [PostalCode]            VARCHAR(20)         NULL,
    [Country]               VARCHAR(50)         NULL CONSTRAINT DF_BankMaster_Country DEFAULT 'US',

    -- ERP / accounting
    [GlAccountId]           INT                 NULL,       -- FK to GlAccountMaster: GL cash account this bank posts to
    [NextCheckNumber]       INT                 NULL CONSTRAINT CK_BankMaster_NextCheck CHECK (NextCheckNumber >= 0),
    [OpeningBalance]        DECIMAL(18,2)       NOT NULL CONSTRAINT DF_BankMaster_OpeningBalance DEFAULT 0,
    [LastReconciledDate]    DATE                NULL,
    [IsDefault]             BIT                 NOT NULL CONSTRAINT DF_BankMaster_IsDefault DEFAULT 0,
    [AllowPayments]         BIT                 NOT NULL CONSTRAINT DF_BankMaster_AllowPayments DEFAULT 1,   -- AP
    [AllowDeposits]         BIT                 NOT NULL CONSTRAINT DF_BankMaster_AllowDeposits DEFAULT 1,   -- AR

    -- Status / audit
    [Notes]              NVARCHAR(MAX)     NULL,
    [IsActive]           BIT               NOT NULL CONSTRAINT DF_BankMaster_IsActive DEFAULT 1,
    [CreatedAt]          DATETIME2         NOT NULL CONSTRAINT DF_BankMaster_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]          DATETIME2         NULL,

    CONSTRAINT PK_BankMaster PRIMARY KEY (BankId),
    CONSTRAINT UQ_BankMaster_BankCode UNIQUE (BankCode),
    CONSTRAINT UQ_BankMaster_Routing_Account UNIQUE (RoutingNumber, AccountNumber),
    CONSTRAINT CK_BankMaster_AccountType CHECK (AccountType IN ('Checking', 'Savings', 'Money Market', 'Credit Line', 'Other'))
)
GO

-- Only one default bank account allowed
CREATE UNIQUE INDEX UX_BankMaster_Default ON dbo.BankMaster (IsDefault) WHERE IsDefault = 1
GO

CREATE INDEX IX_BankMaster_BankName ON dbo.BankMaster (BankName)
GO