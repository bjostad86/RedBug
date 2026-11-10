CREATE TABLE [dbo].[LotMaster]
(
    [LotId]             INT IDENTITY(1,1)   NOT NULL,
    [LotNumber]         VARCHAR(50)         NOT NULL,   -- our lot / batch number
    [ItemId]            INT                 NOT NULL,   -- FK to ItemMaster
    [VendorId]          INT                 NULL,       -- FK to VendorMaster (NULL for lots we produce)
    [VendorLotNumber]   VARCHAR(50)         NULL,       -- supplier's own lot number
 
    -- Status
    [LotStatus]         VARCHAR(20)         NOT NULL CONSTRAINT DF_LotMaster_LotStatus DEFAULT 'Available',
    [HoldReason]        VARCHAR(200)        NULL,
 
    -- Dates
    [ManufactureDate]   DATE                NULL,
    [ReceivedDate]      DATE                NULL,
    [ExpirationDate]    DATE                NULL,
    [BestBeforeDate]    DATE                NULL,
    [RetestDate]        DATE                NULL,
 
    -- Quantities (in the item's unit of measure)
    [UOM]     VARCHAR(10)         NOT NULL CONSTRAINT DF_LotMaster_UOM DEFAULT 'EA',
    [QuantityReceived]  DECIMAL(18,4)       NOT NULL CONSTRAINT DF_LotMaster_QtyReceived DEFAULT 0,
    [QuantityOnHand]    DECIMAL(18,4)       NOT NULL CONSTRAINT DF_LotMaster_QtyOnHand DEFAULT 0,
 
    -- Traceability
    [CountryOfOrigin]   VARCHAR(50)         NULL,
    [CertificateNumber] VARCHAR(50)         NULL,       -- COA / quality cert reference
    [PoNumber]          VARCHAR(30)         NULL,
 
    -- Status / audit
    [Notes]             VARCHAR(MAX)        NULL,
    [IsActive]          BIT                 NOT NULL CONSTRAINT DF_LotMaster_IsActive DEFAULT 1,
    [CreatedAt]         DATETIME            NOT NULL CONSTRAINT DF_LotMaster_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]         DATETIME            NULL,
 
    CONSTRAINT PK_LotMaster PRIMARY KEY (LotId),
    -- a lot number is unique per item (different items may reuse the same number)
    CONSTRAINT UQ_LotMaster_Item_Lot UNIQUE (ItemId, LotNumber),
    CONSTRAINT FK_LotMaster_ItemMaster FOREIGN KEY (ItemId) REFERENCES dbo.ItemMaster (ItemId),
    CONSTRAINT FK_LotMaster_VendorMaster FOREIGN KEY (VendorId) REFERENCES dbo.VendorMaster (VendorId),
    CONSTRAINT CK_LotMaster_Status CHECK (LotStatus IN ('Available', 'Quarantine', 'Hold', 'Expired', 'Consumed')),
    CONSTRAINT CK_LotMaster_Qty CHECK (QuantityReceived >= 0 AND QuantityOnHand >= 0),
    CONSTRAINT CK_LotMaster_Dates CHECK (ExpirationDate IS NULL OR ManufactureDate IS NULL OR ExpirationDate >= ManufactureDate)
);
GO;

CREATE INDEX IX_LotMaster_ItemId         ON dbo.LotMaster (ItemId);
GO;

CREATE INDEX IX_LotMaster_VendorId       ON dbo.LotMaster (VendorId) WHERE VendorId IS NOT NULL;
GO;

CREATE INDEX IX_LotMaster_ExpirationDate ON dbo.LotMaster (ExpirationDate) WHERE ExpirationDate IS NOT NULL;
GO;

CREATE INDEX IX_LotMaster_VendorLot      ON dbo.LotMaster (VendorLotNumber) WHERE VendorLotNumber IS NOT NULL;
GO;