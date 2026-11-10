CREATE TABLE dbo.VendorMaster (
    [VendorId]        INT IDENTITY(1,1) NOT NULL,
    [VendorCode]      VARCHAR(20)       NOT NULL,   -- business key / account number
    [Name]            VARCHAR(200)      NOT NULL,
    [LegalName]       VARCHAR(200)      NULL,
    [VendorTypeId]    INT               NULL,

    -- Primary contact
    [ContactName]     VARCHAR(100)      NULL,
    [Email]           VARCHAR(255)      NULL,
    [Phone]           VARCHAR(30)       NULL,
    [Fax]             VARCHAR(30)       NULL,
    [Website]         VARCHAR(255)      NULL,

    -- Remit-to / purchasing address
    [Address1]        VARCHAR(100)      NULL,
    [Address2]        VARCHAR(100)      NULL,
    [City]            VARCHAR(100)      NULL,
    [State]           VARCHAR(50)       NULL,
    [PostalCode]      VARCHAR(20)       NULL,
    [Country]         VARCHAR(50)       NULL CONSTRAINT DF_VendorMaster_Country DEFAULT 'US',

    -- Terms / financial
    [PaymentTerms]    VARCHAR(20)       NULL,       -- e.g. NET30
    [PaymentMethod]   VARCHAR(20)       NULL,       -- e.g. ACH, Check, Wire
    [CurrencyCode]    CHAR(3)           NOT NULL CONSTRAINT DF_VendorMaster_Currency DEFAULT 'USD',
    [TaxId]           VARCHAR(30)       NULL,       -- EIN / VAT number
    [Is1099Vendor]    BIT               NOT NULL CONSTRAINT DF_VendorMaster_Is1099 DEFAULT 0,
    [LeadTimeDays]    INT               NULL CONSTRAINT CK_VendorMaster_LeadTime CHECK (LeadTimeDays >= 0),
    [MinOrderAmount]  DECIMAL(18,2)     NULL CONSTRAINT CK_VendorMaster_MinOrder CHECK (MinOrderAmount >= 0),

    -- Status / audit
    [Notes]           VARCHAR(MAX)      NULL,
    [IsActive]        BIT               NOT NULL CONSTRAINT DF_VendorMaster_IsActive DEFAULT 1,
    [CreatedAt]       DATETIME          NOT NULL CONSTRAINT DF_VendorMaster_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]       DATETIME          NULL,

    CONSTRAINT PK_VendorMaster PRIMARY KEY (VendorId),
    CONSTRAINT UQ_VendorMaster_VendorCode UNIQUE (VendorCode),
    CONSTRAINT FK_VendorMaster_VendorType FOREIGN KEY (VendorTypeId) REFERENCES dbo.VendorType (VendorTypeId)
);
GO

CREATE INDEX IX_VendorMaster_Name ON dbo.VendorMaster (Name);
GO