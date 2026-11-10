CREATE TABLE [dbo].[AccountsPayable]
(
    [ApId]                  INT IDENTITY(1,1)   NOT NULL,
    [VendorId]              INT                 NOT NULL,   -- FK to VendorMaster
    [InvoiceNumber]         VARCHAR(50)         NOT NULL,   -- vendor's invoice number
    [PurchaseOrderNumber]   VARCHAR(30)         NULL,
    [Description]           VARCHAR(200)        NULL,

    -- Dates
    [InvoiceDate]           DATE                NOT NULL,
    [ReceivedDate]          DATE                NULL,
    [PostingDate]           DATE                NULL,       -- GL posting date
    [DueDate]               DATE                NOT NULL,
    [DiscountDueDate]       DATE                NULL,       -- early-payment discount deadline

    -- Terms
    [PaymentTerms]          VARCHAR(20)         NULL,       -- e.g. NET30, 2/10 NET30
    [DiscountPercent]       DECIMAL(5,2)        NULL CONSTRAINT CK_AccountsPayable_DiscPct CHECK (DiscountPercent BETWEEN 0 AND 100),

    -- Amounts (in invoice currency)
    [CurrencyCode]          CHAR(3)             NOT NULL CONSTRAINT DF_AccountsPayable_Currency DEFAULT 'USD',
    [ExchangeRate]          DECIMAL(18,8)       NOT NULL CONSTRAINT DF_AccountsPayable_ExchRate DEFAULT 1,
    [SubtotalAmount]        DECIMAL(18,2)       NOT NULL CONSTRAINT DF_AccountsPayable_Subtotal DEFAULT 0,
    [TaxAmount]             DECIMAL(18,2)       NOT NULL CONSTRAINT DF_AccountsPayable_Tax DEFAULT 0,
    [FreightAmount]         DECIMAL(18,2)       NOT NULL CONSTRAINT DF_AccountsPayable_Freight DEFAULT 0,
    [TotalAmount]           DECIMAL(18,2)       NOT NULL,
    [DiscountTaken]         DECIMAL(18,2)       NOT NULL CONSTRAINT DF_AccountsPayable_DiscTaken DEFAULT 0,
    [AmountPaid]            DECIMAL(18,2)       NOT NULL CONSTRAINT DF_AccountsPayable_AmountPaid DEFAULT 0,
    [BalanceDue]            AS (TotalAmount - DiscountTaken - AmountPaid) PERSISTED,

    -- Status
    [StatusId]              INT                 NOT NULL CONSTRAINT DF_AccountsPayable_StatusId DEFAULT 2,   -- FK to AccountsPayableStatus (2 = Open)
    [IsOnHold]              BIT                 NOT NULL CONSTRAINT DF_AccountsPayable_IsOnHold DEFAULT 0,
    [HoldReason]            VARCHAR(200)        NULL,
    [ApprovedBy]            VARCHAR(100)        NULL,
    [ApprovedAt]            DATETIME            NULL,

    -- Accounting
    [ApGlAccountId]         INT                 NULL,       -- FK to GlAccountMaster: AP control account (credit)
    [ExpenseGlAccountId]    INT                 NULL,       -- FK to GlAccountMaster: default expense/offset account (debit)

    -- Payment
    [PaymentMethod]         VARCHAR(20)         NULL,       -- ACH, Check, Wire
    [BankId]                INT                 NULL,       -- FK to BankMaster: bank account used to pay
    [CheckNumber]           VARCHAR(20)         NULL,
    [PaidDate]              DATE                NULL,

    -- Audit
    [Notes]                 VARCHAR(MAX)        NULL,
    [CreatedAt]             DATETIME            NOT NULL CONSTRAINT DF_AccountsPayable_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]             DATETIME            NULL,

    CONSTRAINT PK_AccountsPayable PRIMARY KEY (ApId),
    -- a vendor's invoice number can only be entered once (duplicate invoice protection)
    CONSTRAINT UQ_AccountsPayable_Vendor_Invoice UNIQUE (VendorId, InvoiceNumber),
    CONSTRAINT FK_AccountsPayable_VendorMaster FOREIGN KEY (VendorId) REFERENCES dbo.VendorMaster (VendorId),
    CONSTRAINT FK_AccountsPayable_ApGlAccount FOREIGN KEY (ApGlAccountId) REFERENCES dbo.GlAccountMaster (GlAccountId),
    CONSTRAINT FK_AccountsPayable_ExpenseGlAccount FOREIGN KEY (ExpenseGlAccountId) REFERENCES dbo.GlAccountMaster (GlAccountId),
    CONSTRAINT FK_AccountsPayable_BankMaster FOREIGN KEY (BankId) REFERENCES dbo.BankMaster (BankId),
    CONSTRAINT FK_AccountsPayable_Status FOREIGN KEY (StatusId) REFERENCES dbo.AccountsPayableStatus (StatusId),
    CONSTRAINT CK_AccountsPayable_Amounts CHECK (SubtotalAmount >= 0 AND TaxAmount >= 0 AND FreightAmount >= 0
        AND AmountPaid >= 0 AND DiscountTaken >= 0),
    CONSTRAINT CK_AccountsPayable_Total CHECK (TotalAmount = SubtotalAmount + TaxAmount + FreightAmount),
    CONSTRAINT CK_AccountsPayable_NotOverpaid CHECK (AmountPaid + DiscountTaken <= TotalAmount),
    CONSTRAINT CK_AccountsPayable_Dates CHECK (DueDate >= InvoiceDate),
    CONSTRAINT CK_AccountsPayable_ExchRate CHECK (ExchangeRate > 0)
)
GO

CREATE INDEX IX_AccountsPayable_VendorId       ON dbo.AccountsPayable (VendorId)
GO

CREATE INDEX IX_AccountsPayable_PO             ON dbo.AccountsPayable (PurchaseOrderNumber) WHERE PurchaseOrderNumber IS NOT NULL
GO

CREATE INDEX IX_AccountsPayable_BankId         ON dbo.AccountsPayable (BankId) WHERE BankId IS NOT NULL
GO

CREATE INDEX IX_AccountsPayable_DueDate_Status ON dbo.AccountsPayable (DueDate, StatusId)
GO