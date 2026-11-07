CREATE TABLE [dbo].[ItemMaster]
(
    [ItemId]        INT             NOT NULL,
    [ItemNumber]    VARCHAR(50)     NOT NULL,
    [ItemTypeId]    INT             NOT NULL,
    [Description]   VARCHAR(200)    NOT NULL,
    [ExtDesc]       VARCHAR(1000)   NULL,
    [UOM]           VARCHAR(10)     NOT NULL CONSTRAINT DF_ItemMaster_UOM DEFAULT 'EA',
    [StandardCost]  DECIMAL(18,4)   NULL CONSTRAINT CK_ItemMaster_Cost CHECK (StandardCost >= 0),
    [ListPrice]     DECIMAL(18,4)   NULL CONSTRAINT CK_ItemMaster_Price CHECK (ListPrice >= 0),
    [Weight]        DECIMAL(18,4)   NULL,
    [WeightUom]     VARCHAR(10)     NULL,
    [UPC]           VARCHAR(50)     NULL,
    [GTIN]          VARCHAR(50)     NULL,
    [IsActive]      BIT             NOT NULL CONSTRAINT DF_ItemMaster_IsActive DEFAULT 1,
    [CreatedAt]     DATETIME        NOT NULL CONSTRAINT DF_ItemMaster_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]     DATETIME        NULL,
    
    CONSTRAINT PK_ItemMaster PRIMARY KEY (ItemId),
    CONSTRAINT UQ_ItemMaster_ItemNumber UNIQUE (ItemNumber),
    CONSTRAINT FK_ItemMaster_ItemType FOREIGN KEY (ItemTypeId) REFERENCES dbo.ItemType (ItemTypeId)
)