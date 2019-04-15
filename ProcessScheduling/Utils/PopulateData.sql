
SET IDENTITY_INSERT Supply.dbo.Parts ON
INSERT INTO [Supply].[dbo].[Parts]
(Id,Code,Name,Description)
VALUES
(1,1234, 'Lid 1'	, ''),
(2,1235, 'Body 1'	, ''),
(3,1236, 'Box 1'	, ''),
(4,1237, 'Lid 2'	, ''),
(5,1238, 'Body 2'	, ''),
(6,1239, 'Box 2'	, ''),
(7,1240, 'Lid 3'	, ''),
(8,1241, 'Body 3'	, ''),
(9,1242, 'Box 3'	, ''),
(10,1243, 'Lid 4'	, ''),
(11,1244, 'Body 4'	, ''),
(12,1245, 'Box 4'	, '')
SET IDENTITY_INSERT Supply.dbo.Parts OFF

SET IDENTITY_INSERT Supply.dbo.Products ON
INSERT INTO [Supply].[dbo].[Products]
([Id], [Code], [Name], [Description])
VALUES
(1,'162041-00000024', 'SH162041 替换装组合',  ''),
(2,'162041-00000025', 'SH162041 盖底组合(盖前扣GA烫亮', ''),
(3,'162041-00000026', 'SH162041 盖底组合(盖前扣GA烫亮', '')
SET IDENTITY_INSERT Supply.dbo.Products OFF

INSERT INTO [Supply].[dbo].[ProductPart]
(Parts_Id,Products_Id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2)

SET IDENTITY_INSERT Supply.dbo.WorkStationTypes ON
INSERT INTO [Supply].[dbo].[WorkStationTypes]
([Id],[Name],[Description])
VALUES
(1,'IM','Injection Molding'),
(2,'Coating','Coating'),
(3,'Printing','Printing'),
(4,'Gold Plating','Gold Plating'),
(5,'Assembly','Assembly')
SET IDENTITY_INSERT Supply.dbo.WorkStationTypes OFF

SET IDENTITY_INSERT Supply.dbo.Lines ON
INSERT INTO [Supply].[dbo].[Lines]
(Id, Name, Description)
VALUES (1,'Line A','Line A')
SET IDENTITY_INSERT Supply.dbo.Lines OFF

SET IDENTITY_INSERT Supply.dbo.WorkStations ON
INSERT INTO [Supply].[dbo].[WorkStations]
([Id],[Name],[Description],[LineId],[WorkStationTypeId],[PhaseNumber])
VALUES
(1,'IM' ,'Injection Molding',	1,	1,	1),
(2,'Coating','Coating 1',	1,	2,	2),
(3,'Printing','Printing',	1,	3,	3),
(4,'Coating','Coating 2',	1,	2,	4),
(5,'Assembly','Assembly',	1,	5,	5)
SET IDENTITY_INSERT Supply.dbo.WorkStations OFF

SET IDENTITY_INSERT Supply.dbo.Equipments ON
INSERT INTO [Supply].[dbo].[Equipments]
(Id,  Code,  Name,  Description,  ProductionRunTime,  ProductionCapacity,  RunCapacity,  FirstPassYield,  ChangeOrderTime,  ProductionLine,  DownTime,  OperatorCount,  WorkStationId)
VALUES
(1,  '1231',  'Machine 1',  'Machine #1 IM',  8,  5860,  100,  0.9,  '00:00:05.0000000',  'Production Line 1',  '00:10:00.0000000',  0.25,  1),
(2,  '1232',  'Machine 2',  'Machine #2 Coating 1',  8,  2800,  100,  0.9,  '00:00:05.0000000',  'Production Line 1',  '00:10:00.0000000',  0.25,  2),
(3,  '1233',  'Machine 3',  'Machine #3 Printing',  8,  3500,  100,  0.9,  '00:00:05.0000000',  'Production Line 1',  '00:10:00.0000000',  0.25,  3),
(4,  '1234',  'Machine 4',  'Machine #4 Gold Plating',  8,  1200,  100,  0.9,  '00:00:05.0000000',  'Production Line 1',  '00:10:00.0000000',  0.25,  3),
(5,  '1235',  'Machine 5',  'Machine #5 Coating 2',  8,  1400,  100,  0.9,  '00:00:05.0000000',  'Production Line 1',  '00:10:00.0000000',  0.25,  4),
(6,  '1236',  'Machine 6',  'Machine #6 Assembly',  8,  4500,  100,  0.9,  '00:00:05.0000000',  'Production Line 1',  '00:10:00.0000000',  0.25,  5),
(7,  '1237',  'Machine 7',  'Machine #7 IM 2',  8,  3200,  100,  0.9,  '00:00:05.0000000',  'Production Line 1',  '00:10:00.0000000',  0.25,  1)
SET IDENTITY_INSERT Supply.dbo.Equipments OFF

SET IDENTITY_INSERT [Supply].[dbo].[Plans] ON
INSERT INTO [Supply].[dbo].[Plans]
([Id],[Name])
VALUES
(1	,'Plan A'),
(2	,'Plan B')
SET IDENTITY_INSERT [Supply].[dbo].[Plans] OFF

SET IDENTITY_INSERT [Supply].[dbo].[PlanProducts] ON
INSERT INTO [Supply].[dbo].[PlanProducts]
([Id],[PlanId],[ProductId],[TargetNumber])
VALUES
(1	,1	,1	,50000),
(2	,1	,2	,20000)
SET IDENTITY_INSERT [Supply].[dbo].[PlanProducts] OFF

SET IDENTITY_INSERT [Supply].[dbo].[EquipmentSpecifications] ON
INSERT INTO [Supply].[dbo].[EquipmentSpecifications]
([Id],[Type],[Value])
VALUES
(1	,'WeightInTon'	,1),
(2	,'WeightInTon'	,2),
(3	,'WeightInTon'	,3)
SET IDENTITY_INSERT [Supply].[dbo].[EquipmentSpecifications] OFF

SET IDENTITY_INSERT [Supply].[dbo].[EquipmentCategories] ON
INSERT INTO [Supply].[dbo].[EquipmentCategories]
([Id],[Code],[Description])
VALUES
(1	,'IM',	'Injection Molding'),
(2	,'Print',	'Printing or Plating'),
(3	,'Coat',	'Coating'),
(4	,'Assembly',	'Assembly')
SET IDENTITY_INSERT [Supply].[dbo].[EquipmentCategories] OFF

INSERT INTO [Supply].[dbo].[MoldingEquipmentCategory]
([Moldings_Id],[EquipmentCategories_Id])
VALUES
(1	,1),
(2	,1)

INSERT INTO [Supply].[dbo].[MoldingEquipmentSpecification]
([Moldings_Id],[EquipmentSpecifications_Id])
VALUES
(1	,1),
(1	,2),
(2	,1)

INSERT INTO [Supply].[dbo].[EquipmentEquipmentCategory]
([Equipments_Id],[EquipmentCategories_Id])
VALUES
(1	,1),
(2	,2),
(3	,3),
(4	,3),
(5	,2),
(6	,4),
(7	,1)

INSERT INTO [Supply].[dbo].[EquipmentEquipmentSpecification]
([Equipments_Id],[EquipmentSpecifications_Id])
VALUES
(1	,1),
(1	,2),
(2	,1),
(3	,2),
(4	,3),
(5	,2),
(6	,3),
(7	,1)

