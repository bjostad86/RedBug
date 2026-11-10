CREATE TABLE [dbo].[ItemUomConversion]
(
    [ItemUomConversionId]   INT IDENTITY(1,1)   NOT NULL,
    [ItemId]                INT                 NOT NULL,   -- FK to ItemMaster
    [AlternateUom]          VARCHAR(10)         NOT NULL,   -- e.g. CS, PLT, LB, BAG
    [ConversionFactor]      DECIMAL(18,6)       NOT NULL,   -- base units per 1 alternate unit
    [Description]           VARCHAR(100)        NULL,       -- e.g. 'Case of 12'

    -- Where this UOM is used
    [IsPurchasingUom]       BIT                 NOT NULL CONSTRAINT DF_ItemUomConversion_IsPurch DEFAULT 0,
    [IsSalesUom]            BIT                 NOT NULL CONSTRAINT DF_ItemUomConversion_IsSales DEFAULT 0,
    [IsInventoryUom]        BIT                 NOT NULL CONSTRAINT DF_ItemUomConversion_IsInv DEFAULT 0,

    -- Packaging details for this UOM (optional)
    [Barcode]               VARCHAR(50)         NULL,       -- UPC / GTIN for this pack level
    [Weight]                DECIMAL(18,4)       NULL,
    [WeightUom]             VARCHAR(10)         NULL,
    [Length]                DECIMAL(18,4)       NULL,
    [Width]                 DECIMAL(18,4)       NULL,
    [Height]                DECIMAL(18,4)       NULL,
    [DimensionUom]          VARCHAR(10)         NULL,       -- e.g. IN, CM

    -- Status / audit
    [IsActive]              BIT                 NOT NULL CONSTRAINT DF_ItemUomConversion_IsActive DEFAULT 1,
    [CreatedAt]             DATETIME            NOT NULL CONSTRAINT DF_ItemUomConversion_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]             DATETIME            NULL,

    CONSTRAINT PK_ItemUomConversion PRIMARY KEY (ItemUomConversionId),
    -- one conversion per item per alternate UOM
    CONSTRAINT UQ_ItemUomConversion_Item_Uom UNIQUE (ItemId, AlternateUom),
    CONSTRAINT FK_ItemUomConversion_ItemMaster FOREIGN KEY (ItemId) REFERENCES dbo.ItemMaster (ItemId) ON DELETE CASCADE,
    CONSTRAINT CK_ItemUomConversion_Factor CHECK (ConversionFactor > 0)
);
GO;

CREATE INDEX IX_ItemUomConversion_Barcode ON dbo.ItemUomConversion (Barcode) WHERE Barcode IS NOT NULL;
GO;