CREATE TABLE [dbo].[VendorLotXref]
(
    [VendorLotXrefId]     INT IDENTITY(1,1)   NOT NULL,
    [VendorId]            INT                 NOT NULL,
    [LotId]               INT                 NOT NULL,
    [LotNumber]           VARCHAR(50)         NOT NULL,   -- vendor's lot number
    [Description]         VARCHAR(200)        NULL,
    [IsActive]            BIT                 NOT NULL CONSTRAINT DF_VendorLotXref_IsActive    DEFAULT 1,
    [CreatedAt]           DATETIME            NOT NULL CONSTRAINT DF_VendorLotXref_CreatedAt   DEFAULT GETDATE(),
    [UpdatedAt]           DATETIME            NULL,

    CONSTRAINT PK_VendorLotXref PRIMARY KEY (VendorLotXrefId),
    -- a vendor maps a given lot only once, and uses a vendor lot number only once
    CONSTRAINT UQ_VendorLotXref_Vendor_Item   UNIQUE (VendorId, ItemId),
    CONSTRAINT UQ_VendorLotXref_Vendor_Number UNIQUE (VendorId, LotNumber),
    CONSTRAINT FK_VendorLotXref_Vendor FOREIGN KEY (VendorId) REFERENCES dbo.VendorMaster (VendorId),
    CONSTRAINT FK_VendorLotXref_LotMaster FOREIGN KEY (LotId) REFERENCES dbo.LotMaster (LotId)
)