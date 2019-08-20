
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/27/2019 19:21:17
-- Generated from EDMX file: C:\Users\vthieu\source\repos\ProcessScheduling\ProcessScheduling\Models\Scheduling.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Supply];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CompanyCompanyContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompanyContacts] DROP CONSTRAINT [FK_CompanyCompanyContact];
GO
IF OBJECT_ID(N'[dbo].[FK_PartMaterial_Materials]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartMaterial] DROP CONSTRAINT [FK_PartMaterial_Materials];
GO
IF OBJECT_ID(N'[dbo].[FK_PartMaterial_Parts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartMaterial] DROP CONSTRAINT [FK_PartMaterial_Parts];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductPart_Parts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductPart] DROP CONSTRAINT [FK_ProductPart_Parts];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductPart_Products]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductPart] DROP CONSTRAINT [FK_ProductPart_Products];
GO
IF OBJECT_ID(N'[dbo].[FK_LineWorkStation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkStations] DROP CONSTRAINT [FK_LineWorkStation];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkStationEquipment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Equipments] DROP CONSTRAINT [FK_WorkStationEquipment];
GO
IF OBJECT_ID(N'[dbo].[FK_PlanPlanProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlanProducts] DROP CONSTRAINT [FK_PlanPlanProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkStationTypeWorkStation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkStations] DROP CONSTRAINT [FK_WorkStationTypeWorkStation];
GO
IF OBJECT_ID(N'[dbo].[FK_PlanProductProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlanProducts] DROP CONSTRAINT [FK_PlanProductProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_PartMolding]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Moldings] DROP CONSTRAINT [FK_PartMolding];
GO
IF OBJECT_ID(N'[dbo].[FK_MoldingEquipmentSpecification_Molding]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MoldingEquipmentSpecification] DROP CONSTRAINT [FK_MoldingEquipmentSpecification_Molding];
GO
IF OBJECT_ID(N'[dbo].[FK_MoldingEquipmentSpecification_EquipmentSpecification]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MoldingEquipmentSpecification] DROP CONSTRAINT [FK_MoldingEquipmentSpecification_EquipmentSpecification];
GO
IF OBJECT_ID(N'[dbo].[FK_EquipmentEquipmentCategory_Equipment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EquipmentEquipmentCategory] DROP CONSTRAINT [FK_EquipmentEquipmentCategory_Equipment];
GO
IF OBJECT_ID(N'[dbo].[FK_EquipmentEquipmentCategory_EquipmentCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EquipmentEquipmentCategory] DROP CONSTRAINT [FK_EquipmentEquipmentCategory_EquipmentCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_MoldingEquipmentCategory_Molding]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MoldingEquipmentCategory] DROP CONSTRAINT [FK_MoldingEquipmentCategory_Molding];
GO
IF OBJECT_ID(N'[dbo].[FK_MoldingEquipmentCategory_EquipmentCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MoldingEquipmentCategory] DROP CONSTRAINT [FK_MoldingEquipmentCategory_EquipmentCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_EquipmentEquipmentSpecification_Equipment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EquipmentEquipmentSpecification] DROP CONSTRAINT [FK_EquipmentEquipmentSpecification_Equipment];
GO
IF OBJECT_ID(N'[dbo].[FK_EquipmentEquipmentSpecification_EquipmentSpecification]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EquipmentEquipmentSpecification] DROP CONSTRAINT [FK_EquipmentEquipmentSpecification_EquipmentSpecification];
GO
IF OBJECT_ID(N'[dbo].[FK_CompanyOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_CompanyOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderOrderSection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderSections] DROP CONSTRAINT [FK_OrderOrderSection];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductOrderSection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderSections] DROP CONSTRAINT [FK_ProductOrderSection];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Companies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Companies];
GO
IF OBJECT_ID(N'[dbo].[CompanyContacts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompanyContacts];
GO
IF OBJECT_ID(N'[dbo].[Materials]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Materials];
GO
IF OBJECT_ID(N'[dbo].[Parts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parts];
GO
IF OBJECT_ID(N'[dbo].[Plans]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Plans];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Lines]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Lines];
GO
IF OBJECT_ID(N'[dbo].[WorkStations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkStations];
GO
IF OBJECT_ID(N'[dbo].[Equipments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Equipments];
GO
IF OBJECT_ID(N'[dbo].[PlanProducts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlanProducts];
GO
IF OBJECT_ID(N'[dbo].[WorkStationTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkStationTypes];
GO
IF OBJECT_ID(N'[dbo].[Moldings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Moldings];
GO
IF OBJECT_ID(N'[dbo].[EquipmentSpecifications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EquipmentSpecifications];
GO
IF OBJECT_ID(N'[dbo].[EquipmentCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EquipmentCategories];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[OrderSections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderSections];
GO
IF OBJECT_ID(N'[dbo].[PartMaterial]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartMaterial];
GO
IF OBJECT_ID(N'[dbo].[ProductPart]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductPart];
GO
IF OBJECT_ID(N'[dbo].[MoldingEquipmentSpecification]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MoldingEquipmentSpecification];
GO
IF OBJECT_ID(N'[dbo].[EquipmentEquipmentCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EquipmentEquipmentCategory];
GO
IF OBJECT_ID(N'[dbo].[MoldingEquipmentCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MoldingEquipmentCategory];
GO
IF OBJECT_ID(N'[dbo].[EquipmentEquipmentSpecification]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EquipmentEquipmentSpecification];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Companies'
CREATE TABLE [dbo].[Companies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CompanyContacts'
CREATE TABLE [dbo].[CompanyContacts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Fax] nvarchar(max)  NULL,
    [CompanyId] int  NOT NULL
);
GO

-- Creating table 'Materials'
CREATE TABLE [dbo].[Materials] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'Parts'
CREATE TABLE [dbo].[Parts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'Plans'
CREATE TABLE [dbo].[Plans] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'Lines'
CREATE TABLE [dbo].[Lines] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'WorkStations'
CREATE TABLE [dbo].[WorkStations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [LineId] int  NOT NULL,
    [WorkStationTypeId] int  NOT NULL,
    [PhaseNumber] int  NOT NULL
);
GO

-- Creating table 'Equipments'
CREATE TABLE [dbo].[Equipments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [ProductionRunTime] float  NOT NULL,
    [ProductionCapacity] int  NOT NULL,
    [RunCapacity] int  NOT NULL,
    [FirstPassYield] float  NOT NULL,
    [ChangeOrderTime] time  NOT NULL,
    [ProductionLine] nvarchar(max)  NULL,
    [DownTime] time  NOT NULL,
    [OperatorCount] float  NOT NULL,
    [WorkStationId] int  NOT NULL
);
GO

-- Creating table 'PlanProducts'
CREATE TABLE [dbo].[PlanProducts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PlanId] int  NOT NULL,
    [ProductId] int  NOT NULL,
    [TargetNumber] int  NOT NULL
);
GO

-- Creating table 'WorkStationTypes'
CREATE TABLE [dbo].[WorkStationTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'Moldings'
CREATE TABLE [dbo].[Moldings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PartId] int  NOT NULL,
    [Code] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'EquipmentSpecifications'
CREATE TABLE [dbo].[EquipmentSpecifications] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Value] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EquipmentCategories'
CREATE TABLE [dbo].[EquipmentCategories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CompanyId] int  NOT NULL,
    [Number] nvarchar(max)  NOT NULL,
    [CreatedDate] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrderSections'
CREATE TABLE [dbo].[OrderSections] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [OrderId] int  NOT NULL,
    [ProductId] int  NOT NULL,
    [Number] nvarchar(max)  NOT NULL,
    [Quantity] nvarchar(max)  NOT NULL,
    [ScheduleDate] datetime  NOT NULL
);
GO

-- Creating table 'PartMaterial'
CREATE TABLE [dbo].[PartMaterial] (
    [Materials_Id] int  NOT NULL,
    [Parts_Id] int  NOT NULL
);
GO

-- Creating table 'ProductPart'
CREATE TABLE [dbo].[ProductPart] (
    [Parts_Id] int  NOT NULL,
    [Products_Id] int  NOT NULL
);
GO

-- Creating table 'MoldingEquipmentSpecification'
CREATE TABLE [dbo].[MoldingEquipmentSpecification] (
    [Moldings_Id] int  NOT NULL,
    [EquipmentSpecifications_Id] int  NOT NULL
);
GO

-- Creating table 'EquipmentEquipmentCategory'
CREATE TABLE [dbo].[EquipmentEquipmentCategory] (
    [Equipments_Id] int  NOT NULL,
    [EquipmentCategories_Id] int  NOT NULL
);
GO

-- Creating table 'MoldingEquipmentCategory'
CREATE TABLE [dbo].[MoldingEquipmentCategory] (
    [Moldings_Id] int  NOT NULL,
    [EquipmentCategories_Id] int  NOT NULL
);
GO

-- Creating table 'EquipmentEquipmentSpecification'
CREATE TABLE [dbo].[EquipmentEquipmentSpecification] (
    [Equipments_Id] int  NOT NULL,
    [EquipmentSpecifications_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Companies'
ALTER TABLE [dbo].[Companies]
ADD CONSTRAINT [PK_Companies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CompanyContacts'
ALTER TABLE [dbo].[CompanyContacts]
ADD CONSTRAINT [PK_CompanyContacts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Materials'
ALTER TABLE [dbo].[Materials]
ADD CONSTRAINT [PK_Materials]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Parts'
ALTER TABLE [dbo].[Parts]
ADD CONSTRAINT [PK_Parts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Plans'
ALTER TABLE [dbo].[Plans]
ADD CONSTRAINT [PK_Plans]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Lines'
ALTER TABLE [dbo].[Lines]
ADD CONSTRAINT [PK_Lines]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'WorkStations'
ALTER TABLE [dbo].[WorkStations]
ADD CONSTRAINT [PK_WorkStations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Equipments'
ALTER TABLE [dbo].[Equipments]
ADD CONSTRAINT [PK_Equipments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PlanProducts'
ALTER TABLE [dbo].[PlanProducts]
ADD CONSTRAINT [PK_PlanProducts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'WorkStationTypes'
ALTER TABLE [dbo].[WorkStationTypes]
ADD CONSTRAINT [PK_WorkStationTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Moldings'
ALTER TABLE [dbo].[Moldings]
ADD CONSTRAINT [PK_Moldings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EquipmentSpecifications'
ALTER TABLE [dbo].[EquipmentSpecifications]
ADD CONSTRAINT [PK_EquipmentSpecifications]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EquipmentCategories'
ALTER TABLE [dbo].[EquipmentCategories]
ADD CONSTRAINT [PK_EquipmentCategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderSections'
ALTER TABLE [dbo].[OrderSections]
ADD CONSTRAINT [PK_OrderSections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Materials_Id], [Parts_Id] in table 'PartMaterial'
ALTER TABLE [dbo].[PartMaterial]
ADD CONSTRAINT [PK_PartMaterial]
    PRIMARY KEY CLUSTERED ([Materials_Id], [Parts_Id] ASC);
GO

-- Creating primary key on [Parts_Id], [Products_Id] in table 'ProductPart'
ALTER TABLE [dbo].[ProductPart]
ADD CONSTRAINT [PK_ProductPart]
    PRIMARY KEY CLUSTERED ([Parts_Id], [Products_Id] ASC);
GO

-- Creating primary key on [Moldings_Id], [EquipmentSpecifications_Id] in table 'MoldingEquipmentSpecification'
ALTER TABLE [dbo].[MoldingEquipmentSpecification]
ADD CONSTRAINT [PK_MoldingEquipmentSpecification]
    PRIMARY KEY CLUSTERED ([Moldings_Id], [EquipmentSpecifications_Id] ASC);
GO

-- Creating primary key on [Equipments_Id], [EquipmentCategories_Id] in table 'EquipmentEquipmentCategory'
ALTER TABLE [dbo].[EquipmentEquipmentCategory]
ADD CONSTRAINT [PK_EquipmentEquipmentCategory]
    PRIMARY KEY CLUSTERED ([Equipments_Id], [EquipmentCategories_Id] ASC);
GO

-- Creating primary key on [Moldings_Id], [EquipmentCategories_Id] in table 'MoldingEquipmentCategory'
ALTER TABLE [dbo].[MoldingEquipmentCategory]
ADD CONSTRAINT [PK_MoldingEquipmentCategory]
    PRIMARY KEY CLUSTERED ([Moldings_Id], [EquipmentCategories_Id] ASC);
GO

-- Creating primary key on [Equipments_Id], [EquipmentSpecifications_Id] in table 'EquipmentEquipmentSpecification'
ALTER TABLE [dbo].[EquipmentEquipmentSpecification]
ADD CONSTRAINT [PK_EquipmentEquipmentSpecification]
    PRIMARY KEY CLUSTERED ([Equipments_Id], [EquipmentSpecifications_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CompanyId] in table 'CompanyContacts'
ALTER TABLE [dbo].[CompanyContacts]
ADD CONSTRAINT [FK_CompanyCompanyContact]
    FOREIGN KEY ([CompanyId])
    REFERENCES [dbo].[Companies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompanyCompanyContact'
CREATE INDEX [IX_FK_CompanyCompanyContact]
ON [dbo].[CompanyContacts]
    ([CompanyId]);
GO

-- Creating foreign key on [Materials_Id] in table 'PartMaterial'
ALTER TABLE [dbo].[PartMaterial]
ADD CONSTRAINT [FK_PartMaterial_Materials]
    FOREIGN KEY ([Materials_Id])
    REFERENCES [dbo].[Materials]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Parts_Id] in table 'PartMaterial'
ALTER TABLE [dbo].[PartMaterial]
ADD CONSTRAINT [FK_PartMaterial_Parts]
    FOREIGN KEY ([Parts_Id])
    REFERENCES [dbo].[Parts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartMaterial_Parts'
CREATE INDEX [IX_FK_PartMaterial_Parts]
ON [dbo].[PartMaterial]
    ([Parts_Id]);
GO

-- Creating foreign key on [Parts_Id] in table 'ProductPart'
ALTER TABLE [dbo].[ProductPart]
ADD CONSTRAINT [FK_ProductPart_Parts]
    FOREIGN KEY ([Parts_Id])
    REFERENCES [dbo].[Parts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_Id] in table 'ProductPart'
ALTER TABLE [dbo].[ProductPart]
ADD CONSTRAINT [FK_ProductPart_Products]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductPart_Products'
CREATE INDEX [IX_FK_ProductPart_Products]
ON [dbo].[ProductPart]
    ([Products_Id]);
GO

-- Creating foreign key on [LineId] in table 'WorkStations'
ALTER TABLE [dbo].[WorkStations]
ADD CONSTRAINT [FK_LineWorkStation]
    FOREIGN KEY ([LineId])
    REFERENCES [dbo].[Lines]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LineWorkStation'
CREATE INDEX [IX_FK_LineWorkStation]
ON [dbo].[WorkStations]
    ([LineId]);
GO

-- Creating foreign key on [WorkStationId] in table 'Equipments'
ALTER TABLE [dbo].[Equipments]
ADD CONSTRAINT [FK_WorkStationEquipment]
    FOREIGN KEY ([WorkStationId])
    REFERENCES [dbo].[WorkStations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkStationEquipment'
CREATE INDEX [IX_FK_WorkStationEquipment]
ON [dbo].[Equipments]
    ([WorkStationId]);
GO

-- Creating foreign key on [PlanId] in table 'PlanProducts'
ALTER TABLE [dbo].[PlanProducts]
ADD CONSTRAINT [FK_PlanPlanProduct]
    FOREIGN KEY ([PlanId])
    REFERENCES [dbo].[Plans]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlanPlanProduct'
CREATE INDEX [IX_FK_PlanPlanProduct]
ON [dbo].[PlanProducts]
    ([PlanId]);
GO

-- Creating foreign key on [WorkStationTypeId] in table 'WorkStations'
ALTER TABLE [dbo].[WorkStations]
ADD CONSTRAINT [FK_WorkStationTypeWorkStation]
    FOREIGN KEY ([WorkStationTypeId])
    REFERENCES [dbo].[WorkStationTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkStationTypeWorkStation'
CREATE INDEX [IX_FK_WorkStationTypeWorkStation]
ON [dbo].[WorkStations]
    ([WorkStationTypeId]);
GO

-- Creating foreign key on [ProductId] in table 'PlanProducts'
ALTER TABLE [dbo].[PlanProducts]
ADD CONSTRAINT [FK_PlanProductProduct]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlanProductProduct'
CREATE INDEX [IX_FK_PlanProductProduct]
ON [dbo].[PlanProducts]
    ([ProductId]);
GO

-- Creating foreign key on [PartId] in table 'Moldings'
ALTER TABLE [dbo].[Moldings]
ADD CONSTRAINT [FK_PartMolding]
    FOREIGN KEY ([PartId])
    REFERENCES [dbo].[Parts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartMolding'
CREATE INDEX [IX_FK_PartMolding]
ON [dbo].[Moldings]
    ([PartId]);
GO

-- Creating foreign key on [Moldings_Id] in table 'MoldingEquipmentSpecification'
ALTER TABLE [dbo].[MoldingEquipmentSpecification]
ADD CONSTRAINT [FK_MoldingEquipmentSpecification_Molding]
    FOREIGN KEY ([Moldings_Id])
    REFERENCES [dbo].[Moldings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [EquipmentSpecifications_Id] in table 'MoldingEquipmentSpecification'
ALTER TABLE [dbo].[MoldingEquipmentSpecification]
ADD CONSTRAINT [FK_MoldingEquipmentSpecification_EquipmentSpecification]
    FOREIGN KEY ([EquipmentSpecifications_Id])
    REFERENCES [dbo].[EquipmentSpecifications]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MoldingEquipmentSpecification_EquipmentSpecification'
CREATE INDEX [IX_FK_MoldingEquipmentSpecification_EquipmentSpecification]
ON [dbo].[MoldingEquipmentSpecification]
    ([EquipmentSpecifications_Id]);
GO

-- Creating foreign key on [Equipments_Id] in table 'EquipmentEquipmentCategory'
ALTER TABLE [dbo].[EquipmentEquipmentCategory]
ADD CONSTRAINT [FK_EquipmentEquipmentCategory_Equipment]
    FOREIGN KEY ([Equipments_Id])
    REFERENCES [dbo].[Equipments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [EquipmentCategories_Id] in table 'EquipmentEquipmentCategory'
ALTER TABLE [dbo].[EquipmentEquipmentCategory]
ADD CONSTRAINT [FK_EquipmentEquipmentCategory_EquipmentCategory]
    FOREIGN KEY ([EquipmentCategories_Id])
    REFERENCES [dbo].[EquipmentCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipmentEquipmentCategory_EquipmentCategory'
CREATE INDEX [IX_FK_EquipmentEquipmentCategory_EquipmentCategory]
ON [dbo].[EquipmentEquipmentCategory]
    ([EquipmentCategories_Id]);
GO

-- Creating foreign key on [Moldings_Id] in table 'MoldingEquipmentCategory'
ALTER TABLE [dbo].[MoldingEquipmentCategory]
ADD CONSTRAINT [FK_MoldingEquipmentCategory_Molding]
    FOREIGN KEY ([Moldings_Id])
    REFERENCES [dbo].[Moldings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [EquipmentCategories_Id] in table 'MoldingEquipmentCategory'
ALTER TABLE [dbo].[MoldingEquipmentCategory]
ADD CONSTRAINT [FK_MoldingEquipmentCategory_EquipmentCategory]
    FOREIGN KEY ([EquipmentCategories_Id])
    REFERENCES [dbo].[EquipmentCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MoldingEquipmentCategory_EquipmentCategory'
CREATE INDEX [IX_FK_MoldingEquipmentCategory_EquipmentCategory]
ON [dbo].[MoldingEquipmentCategory]
    ([EquipmentCategories_Id]);
GO

-- Creating foreign key on [Equipments_Id] in table 'EquipmentEquipmentSpecification'
ALTER TABLE [dbo].[EquipmentEquipmentSpecification]
ADD CONSTRAINT [FK_EquipmentEquipmentSpecification_Equipment]
    FOREIGN KEY ([Equipments_Id])
    REFERENCES [dbo].[Equipments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [EquipmentSpecifications_Id] in table 'EquipmentEquipmentSpecification'
ALTER TABLE [dbo].[EquipmentEquipmentSpecification]
ADD CONSTRAINT [FK_EquipmentEquipmentSpecification_EquipmentSpecification]
    FOREIGN KEY ([EquipmentSpecifications_Id])
    REFERENCES [dbo].[EquipmentSpecifications]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipmentEquipmentSpecification_EquipmentSpecification'
CREATE INDEX [IX_FK_EquipmentEquipmentSpecification_EquipmentSpecification]
ON [dbo].[EquipmentEquipmentSpecification]
    ([EquipmentSpecifications_Id]);
GO

-- Creating foreign key on [CompanyId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_CompanyOrder]
    FOREIGN KEY ([CompanyId])
    REFERENCES [dbo].[Companies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompanyOrder'
CREATE INDEX [IX_FK_CompanyOrder]
ON [dbo].[Orders]
    ([CompanyId]);
GO

-- Creating foreign key on [OrderId] in table 'OrderSections'
ALTER TABLE [dbo].[OrderSections]
ADD CONSTRAINT [FK_OrderOrderSection]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderOrderSection'
CREATE INDEX [IX_FK_OrderOrderSection]
ON [dbo].[OrderSections]
    ([OrderId]);
GO

-- Creating foreign key on [ProductId] in table 'OrderSections'
ALTER TABLE [dbo].[OrderSections]
ADD CONSTRAINT [FK_ProductOrderSection]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductOrderSection'
CREATE INDEX [IX_FK_ProductOrderSection]
ON [dbo].[OrderSections]
    ([ProductId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------