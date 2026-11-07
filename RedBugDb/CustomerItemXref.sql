CREATE TABLE [dbo].[CustomerItemXref]
(
    [CustomerItemXrefId]    INT IDENTITY(1,1)   NOT NULL,
    [CustomerId]            INT                 NOT NULL,
    [ItemId]                INT                 NOT NULL,
    [ItemNumber]            VARCHAR(50)         NOT NULL,   -- customer's part number
    [Description]           VARCHAR(200)        NULL,
    [UPC]                   VARCHAR(50)         NULL,
    [UOM]                   VARCHAR(10)         NULL,
    [IsActive]              BIT                 NOT NULL CONSTRAINT DF_CustomerItemXref_IsActive DEFAULT 1,
    [CreatedAt]             DATETIME            NOT NULL CONSTRAINT DF_CustomerItemXref_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]             DATETIME         NULL,
    
    CONSTRAINT PK_CustomerItemXref PRIMARY KEY (CustomerItemXrefId),
    -- a customer maps a given item only once, and uses a customer part number only once
    CONSTRAINT UQ_CustomerItemXref_Customer_Item   UNIQUE (CustomerId, ItemId),
    CONSTRAINT UQ_CustomerItemXref_Customer_Number UNIQUE (CustomerId, ItemNumber),
    CONSTRAINT FK_CustomerItemXref_Customer FOREIGN KEY (CustomerId) REFERENCES dbo.Customer (CustomerId),
    CONSTRAINT FK_CustomerItemXref_ItemMaster FOREIGN KEY (ItemId) REFERENCES dbo.ItemMaster (ItemId)
)