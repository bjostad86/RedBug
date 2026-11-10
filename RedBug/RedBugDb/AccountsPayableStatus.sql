CREATE TABLE [dbo].[AccountsPayableStatus]
(
    [StatusId]      INT             NOT NULL,
    [StatusCode]    VARCHAR(20)     NOT NULL,   -- e.g. Open, Paid
    [Description]   VARCHAR(100)    NOT NULL,
    [SortOrder]     INT             NOT NULL CONSTRAINT DF_AccountsPayableStatus_Sort DEFAULT 0,
    [AllowPayment]  BIT             NOT NULL CONSTRAINT DF_AccountsPayableStatus_AllowPay DEFAULT 0,  -- invoice can be paid in this status
    [IsClosed]      BIT             NOT NULL CONSTRAINT DF_AccountsPayableStatus_IsClosed DEFAULT 0,  -- Paid / Void: excluded from open payables
    [IsActive]      BIT             NOT NULL CONSTRAINT DF_AccountsPayableStatus_IsActive DEFAULT 1,
    [CreatedAt]     DATETIME        NOT NULL CONSTRAINT DF_AccountsPayableStatus_CreatedAt DEFAULT GETDATE(),
    
    CONSTRAINT PK_AccountsPayableStatus PRIMARY KEY (StatusId),
    CONSTRAINT UQ_AccountsPayableStatus_StatusCode UNIQUE (StatusCode)
)
GO

/*
INSERT INTO dbo.AccountsPayableStatus (StatusId, StatusCode, Description, SortOrder, AllowPayment, IsClosed) 
VALUES
(1, 'Draft',         'Entered, not yet submitted', 10, 0, 0),
(2, 'Open',          'Posted, awaiting approval',  20, 0, 0),
(3, 'Approved',      'Approved for payment',       30, 1, 0),
(4, 'PartiallyPaid', 'Partially paid',             40, 1, 0),
(5, 'Paid',          'Paid in full',               50, 0, 1),
(6, 'Void',          'Voided',                     60, 0, 1);
 */