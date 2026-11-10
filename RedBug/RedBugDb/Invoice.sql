CREATE TABLE dbo.Invoice 
(
    [InvoiceId]             INT IDENTITY(1,1)   NOT NULL,
    [InvoiceNumber]         VARCHAR(30)         NOT NULL,   -- our invoice number
    [CustomerId]            INT                 NOT NULL,   -- FK to Customer
    [CustomerPoNumber]      VARCHAR(30)         NULL,       -- customer's purchase order
    [SalesOrderNumber]      VARCHAR(30)         NULL,
    [Description]           VARCHAR(200)        NULL,

    -- Dates
    [InvoiceDate]           DATE                NOT NULL,
    [ShipDate]              DATE                NULL,
    [PostingDate]           DATE                NULL,       -- GL posting date
    [DueDate]               DATE                NOT NULL,

    -- Terms
    [PaymentTerms]          VARCHAR(20)         NULL,       -- e.g. NET30
    [DiscountPercent]       DECIMAL(5,2)        NULL CONSTRAINT CK_Invoice_DiscPct CHECK (DiscountPercent BETWEEN 0 AND 100),
    [DiscountDueDate]       DATE                NULL,       -- early-payment discount deadline

    -- Bill-to / ship-to (copied from the customer at invoice time so later
    -- customer address changes do not alter issued invoices)
    [BillName]              VARCHAR(200)        NULL,
    [BillAddress1]          VARCHAR(100)        NULL,
    [BillAddress2]          VARCHAR(100)        NULL,
    [BillCity]              VARCHAR(100)        NULL,
    [BillState]             VARCHAR(50)         NULL,
    [BillPostalCode]        VARCHAR(20)         NULL,
    [BillCountry]           VARCHAR(50)         NULL,
    [ShipName]              VARCHAR(200)        NULL,
    [ShipAddress1]          VARCHAR(100)        NULL,
    [ShipAddress2]          VARCHAR(100)        NULL,
    [ShipCity]              VARCHAR(100)        NULL,
    [ShipState]             VARCHAR(50)         NULL,
    [ShipPostalCode]        VARCHAR(20)         NULL,
    [ShipCountry]           VARCHAR(50)         NULL,

    -- Amounts (in invoice currency)
    [CurrencyCode]          CHAR(3)             NOT NULL CONSTRAINT DF_Invoice_Currency DEFAULT 'USD',
    [ExchangeRate]          DECIMAL(18,8)       NOT NULL CONSTRAINT DF_Invoice_ExchRate DEFAULT 1,
    [SubtotalAmount]        DECIMAL(18,2)       NOT NULL CONSTRAINT DF_Invoice_Subtotal DEFAULT 0,
    [DiscountAmount]        DECIMAL(18,2)       NOT NULL CONSTRAINT DF_Invoice_DiscountAmt DEFAULT 0,   -- invoice-level discount
    [TaxAmount]             DECIMAL(18,2)       NOT NULL CONSTRAINT DF_Invoice_Tax DEFAULT 0,
    [FreightAmount]         DECIMAL(18,2)       NOT NULL CONSTRAINT DF_Invoice_Freight DEFAULT 0,
    [TotalAmount]           DECIMAL(18,2)       NOT NULL,
    [AmountPaid]            DECIMAL(18,2)       NOT NULL CONSTRAINT DF_Invoice_AmountPaid DEFAULT 0,
    [BalanceDue]            AS (TotalAmount - AmountPaid) PERSISTED,

    -- Status
    [StatusId]              INT                 NOT NULL CONSTRAINT DF_Invoice_StatusId DEFAULT 2,   -- FK to InvoiceStatus (2 = Open)
    [IsOnHold]              BIT                 NOT NULL CONSTRAINT DF_Invoice_IsOnHold DEFAULT 0,
    [HoldReason]            VARCHAR(200)        NULL,
    [PaidDate]              DATE                NULL,
    [SentAt]                DATETIME            NULL,       -- when the invoice was emailed / transmitted (e.g. EDI 810)

    -- Accounting
    [ArGlAccountId]         INT                 NULL,       -- FK to GlAccountMaster: AR control account (debit)
    [RevenueGlAccountId]    INT                 NULL,       -- FK to GlAccountMaster: default revenue account (credit)

    -- Audit
    [Notes]                 VARCHAR(MAX)        NULL,
    [CreatedAt]             DATETIME            NOT NULL CONSTRAINT DF_Invoice_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]             DATETIME            NULL,

    CONSTRAINT PK_Invoice PRIMARY KEY (InvoiceId),
    CONSTRAINT UQ_Invoice_InvoiceNumber UNIQUE (InvoiceNumber),
    CONSTRAINT FK_Invoice_Customer FOREIGN KEY (CustomerId) REFERENCES dbo.Customer (CustomerId),
    CONSTRAINT FK_Invoice_Status FOREIGN KEY (StatusId) REFERENCES dbo.InvoiceStatus (StatusId),
    CONSTRAINT FK_Invoice_ArGlAccount FOREIGN KEY (ArGlAccountId) REFERENCES dbo.GlAccountMaster (GlAccountId),
    CONSTRAINT FK_Invoice_RevenueGlAccount FOREIGN KEY (RevenueGlAccountId) REFERENCES dbo.GlAccountMaster (GlAccountId),
    CONSTRAINT CK_Invoice_Amounts CHECK (SubtotalAmount >= 0 AND DiscountAmount >= 0 AND TaxAmount >= 0 AND FreightAmount >= 0 AND AmountPaid >= 0),
    CONSTRAINT CK_Invoice_Total CHECK (TotalAmount = SubtotalAmount - DiscountAmount + TaxAmount + FreightAmount),
    CONSTRAINT CK_Invoice_NotOverpaid CHECK (AmountPaid <= TotalAmount),
    CONSTRAINT CK_Invoice_Dates CHECK (DueDate >= InvoiceDate),
    CONSTRAINT CK_Invoice_ExchRate CHECK (ExchangeRate > 0)
)
GO

CREATE INDEX IX_Invoice_CustomerId       ON dbo.Invoice (CustomerId)
GO

CREATE INDEX IX_Invoice_DueDate_Status   ON dbo.Invoice (DueDate, StatusId)
GO

CREATE INDEX IX_Invoice_InvoiceDate      ON dbo.Invoice (InvoiceDate)
GO

CREATE INDEX IX_Invoice_CustomerPo       ON dbo.Invoice (CustomerPoNumber) WHERE CustomerPoNumber IS NOT NULL
GO

CREATE INDEX IX_Invoice_SalesOrder       ON dbo.Invoice (SalesOrderNumber) WHERE SalesOrderNumber IS NOT NULL
GO