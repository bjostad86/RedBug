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

    CONSTRAINT PK_CustomerLotXref PRIMARY KEY (CustomerLotXrefId),
    CONSTRAINT UQ_CustomerLotXref_Customer_Lot   UNIQUE (CustomerId, LotId),
    CONSTRAINT UQ_CustomerLotXref_Customer_Number UNIQUE (CustomerId, LotNumber),
    CONSTRAINT FK_CustomerLotXref_Customer FOREIGN KEY (CustomerId) REFERENCES dbo.CustomerMaster (CustomerId),
    CONSTRAINT FK_CustomerLotXref_LotMaster FOREIGN KEY (LotId) REFERENCES dbo.LotMaster (LotId)
)
GO;