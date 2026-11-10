CREATE TABLE [dbo].[VendorItemXref]
(
    [VendorItemXrefId]    INT IDENTITY(1,1) NOT NULL,
    [VendorId]            INT               NOT NULL,
    [ItemId]              INT               NOT NULL,
    [ItemNumber]          VARCHAR(50)       NOT NULL,   -- customer's part number
    [Description]         VARCHAR(200)      NULL,
    [UPC]                 VARCHAR(50)       NULL,
    [UOM]                 VARCHAR(10)       NULL,
    [IsActive]            BIT               NOT NULL CONSTRAINT DF_VendorItemXref_IsActive  DEFAULT 1,
    [CreatedAt]           DATETIME          NOT NULL CONSTRAINT DF_VendorItemXref_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]           DATETIME          NULL,

    CONSTRAINT PK_VendorItemXref PRIMARY KEY (VendorItemXrefId),
    -- a customer maps a given item only once, and uses a customer part number only once
    CONSTRAINT UQ_VendorItemXref_Vendor_Item   UNIQUE (VendorId, ItemId),
    CONSTRAINT UQ_VendorItemXref_Vendor_Number UNIQUE (VendorId, ItemNumber),
    CONSTRAINT FK_VendorItemXref_Vendor FOREIGN KEY (VendorId) REFERENCES dbo.VendorMaster (VendorId),
    CONSTRAINT FK_VendorItemXref_ItemMaster FOREIGN KEY (ItemId) REFERENCES dbo.ItemMaster (ItemId)
)