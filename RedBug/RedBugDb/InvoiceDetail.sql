CREATE TABLE [dbo].[InvoiceDetail]
(
    [InvoiceDetailId]       INT IDENTITY(1,1)   NOT NULL,
    [InvoiceId]             INT                 NOT NULL,   -- FK to Invoice (header)
    [LineNumber]            INT                 NOT NULL,   -- 1, 2, 3 ... within the invoice

    -- What was sold
    [ItemId]                INT                 NULL,       -- FK to ItemMaster (NULL for non-stock lines such as fees)
    [ItemNumber]            VARCHAR(50)         NULL,       -- copied at invoice time
    [CustomerItemNumber]    VARCHAR(50)         NULL,       -- customer's part number (from CustomerItemXref)
    [Description]           VARCHAR(200)        NOT NULL,
    [LotId]                 INT                 NULL,       -- FK to LotMaster (lot-tracked items)

    -- Quantity and price
    [QuantityOrdered]       DECIMAL(18,4)       NULL,
    [Quantity]              DECIMAL(18,4)       NOT NULL,   -- quantity invoiced
    [UnitOfMeasure]         VARCHAR(10)         NOT NULL CONSTRAINT DF_InvoiceDetail_UOM DEFAULT 'EA',
    [UnitPrice]             DECIMAL(18,4)       NOT NULL,
    [DiscountPercent]       DECIMAL(5,2)        NOT NULL CONSTRAINT DF_InvoiceDetail_DiscPct DEFAULT 0,
    [LineAmount]            AS (ROUND(Quantity * UnitPrice * (1 - DiscountPercent / 100.0), 2)) PERSISTED,

    -- Tax
    [IsTaxable]             BIT                 NOT NULL CONSTRAINT DF_InvoiceDetail_IsTaxable DEFAULT 1,
    [TaxCode]               VARCHAR(20)         NULL,
    [TaxAmount]             DECIMAL(18,2)       NOT NULL CONSTRAINT DF_InvoiceDetail_TaxAmount DEFAULT 0,

    -- Cost (for margin reporting)
    [UnitCost]              DECIMAL(18,4)       NULL,

    -- Accounting
    [RevenueGlAccountId]    INT                 NULL,       -- FK to GlAccountMaster: overrides the header's default revenue account

    -- Audit
    [Notes]                 VARCHAR(500)        NULL,
    [CreatedAt]             DATETIME            NOT NULL CONSTRAINT DF_InvoiceDetail_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]             DATETIME            NULL,

    CONSTRAINT PK_InvoiceDetail PRIMARY KEY (InvoiceDetailId),
    CONSTRAINT UQ_InvoiceDetail_Invoice_Line UNIQUE (InvoiceId, LineNumber),
    CONSTRAINT FK_InvoiceDetail_Invoice FOREIGN KEY (InvoiceId) REFERENCES dbo.Invoice (InvoiceId) ON DELETE CASCADE,
    CONSTRAINT FK_InvoiceDetail_ItemMaster FOREIGN KEY (ItemId) REFERENCES dbo.ItemMaster (ItemId),
    CONSTRAINT FK_InvoiceDetail_LotMaster FOREIGN KEY (LotId) REFERENCES dbo.LotMaster (LotId),
    CONSTRAINT FK_InvoiceDetail_RevenueGlAccount FOREIGN KEY (RevenueGlAccountId) REFERENCES dbo.GlAccountMaster (GlAccountId),
    CONSTRAINT CK_InvoiceDetail_LineNumber CHECK (LineNumber > 0),
    -- negative quantity allowed (credit/return lines); price and tax may not be negative
    CONSTRAINT CK_InvoiceDetail_Quantity CHECK (Quantity <> 0),
    CONSTRAINT CK_InvoiceDetail_Price CHECK (UnitPrice >= 0 AND (UnitCost IS NULL OR UnitCost >= 0)),
    CONSTRAINT CK_InvoiceDetail_DiscPct CHECK (DiscountPercent BETWEEN 0 AND 100),
    CONSTRAINT CK_InvoiceDetail_Tax CHECK (TaxAmount >= 0 AND (IsTaxable = 1 OR TaxAmount = 0))
)
GO

CREATE INDEX IX_InvoiceDetail_ItemId ON dbo.InvoiceDetail (ItemId) WHERE ItemId IS NOT NULL
GO

CREATE INDEX IX_InvoiceDetail_LotId  ON dbo.InvoiceDetail (LotId)  WHERE LotId IS NOT NULL
GO