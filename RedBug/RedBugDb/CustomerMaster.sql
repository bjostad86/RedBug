CREATE TABLE [dbo].[CustomerMaster]
(
    [CustomerId]      INT IDENTITY(1,1) NOT NULL,
    [CustomerCode]    VARCHAR(20)       NOT NULL,   -- business key / account number
    [Name]            VARCHAR(200)      NOT NULL,
    [LegalName]       VARCHAR(200)      NULL,
    [CustomerTypeId]  INT               NULL,       -- e.g. Retail, Distributor, Wholesale

    -- Primary contact
    [ContactName]     VARCHAR(100)      NULL,
    [Email]           VARCHAR(255)      NULL,
    [Phone]           VARCHAR(30)       NULL,
    [Fax]             VARCHAR(30)       NULL,
    [Website]         VARCHAR(255)      NULL,

    -- Billing address
    [BillAddress1]    VARCHAR(100)      NULL,
    [BillAddress2]    VARCHAR(100)      NULL,
    [BillCity]        VARCHAR(100)      NULL,
    [BillState]       VARCHAR(50)       NULL,
    [BillPostalCode]  VARCHAR(20)       NULL,
    [BillCountry]     VARCHAR(50)       NULL CONSTRAINT DF_Customer_BillCountry DEFAULT 'US',

    -- Shipping address
    [ShipAddress1]    VARCHAR(100)      NULL,
    [ShipAddress2]    VARCHAR(100)      NULL,
    [ShipCity]        VARCHAR(100)      NULL,
    [ShipState]       VARCHAR(50)       NULL,
    [ShipPostalCode]  VARCHAR(20)       NULL,
    [ShipCountry]     VARCHAR(50)       NULL CONSTRAINT DF_Customer_ShipCountry DEFAULT 'US',

    -- Terms / financial
    [PaymentTerms]    VARCHAR(20)       NULL,       -- e.g. NET30
    [CreditLimit]     DECIMAL(18,2)     NULL CONSTRAINT CK_Customer_CreditLimit CHECK (CreditLimit >= 0),
    [CurrencyCode]    CHAR(3)           NOT NULL CONSTRAINT DF_Customer_Currency DEFAULT 'USD',
    [TaxId]           VARCHAR(30)       NULL,
    [IsTaxExempt]     BIT               NOT NULL CONSTRAINT DF_Customer_IsTaxExempt DEFAULT 0,

    -- Status / audit
    [Notes]           VARCHAR(MAX)      NULL,
    [IsActive]        BIT               NOT NULL CONSTRAINT DF_Customer_IsActive DEFAULT 1,
    [CreatedAt]       DATETIME          NOT NULL CONSTRAINT DF_Customer_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]       DATETIME          NULL,

    CONSTRAINT PK_CustomerMaster PRIMARY KEY (CustomerId),
    CONSTRAINT UQ_CustomerMaster_CustomerCode UNIQUE (CustomerCode),
    CONSTRAINT FK_CustomerMaster_CustomerType FOREIGN KEY (CustomerTypeId) REFERENCES dbo.CustomerType (CustomerTypeId)
)
GO;