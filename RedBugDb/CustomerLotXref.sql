CREATE TABLE [dbo].[CustomerLotXref]
(
    [CustomerLotXrefId]     INT IDENTITY(1,1)   NOT NULL,
    [CustomerId]            INT                 NOT NULL,
    [LotId]                 INT                 NOT NULL,
    [LotNumber]             VARCHAR(50)         NOT NULL,   -- customer's lot number
    [Description]           VARCHAR(200)        NULL,
    [IsActive]              BIT                 NOT NULL CONSTRAINT DF_CustomerLotXref_IsActive     DEFAULT 1,
    [CreatedAt]             DATETIME            NOT NULL CONSTRAINT DF_CustomerLotXref_CreatedAt    DEFAULT GETDATE(),
    [UpdatedAt]             DATETIME            NULL,

    CONSTRAINT PK_CustomerLotXref PRIMARY KEY (CustomerItemXrefId),
    -- a customer maps a given lot only once, and uses a customer lot number only once
    CONSTRAINT UQ_CustomerLotXref_Customer_Item   UNIQUE (CustomerId, ItemId),
    CONSTRAINT UQ_CustomerLotXref_Customer_Number UNIQUE (CustomerId, LotNumber),
    CONSTRAINT FK_CustomerLotXref_Customer FOREIGN KEY (CustomerId) REFERENCES dbo.CustomerMaster (CustomerId),
    CONSTRAINT FK_CustomerLotXref_ItemMaster FOREIGN KEY (LotId) REFERENCES dbo.LotMaster (LotId)
)