use AircraftPLM;
select * from Product;
select * from Component;
select * from BOM;
select * from Revision;
select * from ChangeRequest;
select * from Engineers;
select * from ChangeApproval;

-- What components belong to each product?
select p.ProductName, c.ComponentName from Product as p
inner join Component as c on p.ProductID=c.ProductID;

-- What and how many materials needed to manufacture products?
select p.ProductName,c.ComponentName,b.Quantity from Product as p
inner join Component as c on p.ProductID=c.ProductID
inner join BOM as b on c.ComponentID=b.ComponentID;

-- Which product has the most components?
select p.ProductName as ProductName,count(c.ComponentID) as Total_Components from Product as p
inner join Component as c on p.ProductID=c.ProductID
group by ProductName;

-- How many parts are needed for each product?
select p.ProductName as ProductName, sum(b.Quantity) as Total_Quanitity from Product as p
inner join BOM as b on p.ProductID=b.ProductID
group by ProductName;

-- What revision exists?
select p.ProductName, c.ComponentName,r.RevisionCode,r.RevisionDate from Product as p
inner join Component as c on p.ProductID=c.ProductID
inner join Revision as r on c.ComponentID=r.ComponentID;

-- Which parts were modified?
select c.ComponentName as ComponentName,count(r.RevisionCode) as Revision_Count from Component as c
inner join Revision as r on c.ComponentID=r.ComponentID
group by ComponentName
having count(r.RevisionCode)>1;

-- Which revision is currently active?
select c.ComponentName ComponentName,max(r.RevisionCode) as LatestRevision from Component as c
inner join Revision as r on c.ComponentID=r.ComponentID
group by ComponentName;

select * from ChangeRequest;
-- What request status is approved?
select p.ProductName,c.ComponentName,cr.Description,cr.Status from Product as p
inner join Component as c on p.ProductID=c.ProductID
inner join ChangeRequest as cr on c.ComponentID=cr.ComponentID
where cr.Status='Approved';

-- What request status still needs an approval?
select p.ProductName,c.ComponentName,cr.Description,cr.Status from Product as p
inner join Component as c on p.ProductID=c.ProductID
inner join ChangeRequest as cr on c.ComponentID=cr.ComponentID
where cr.Status='Pending';

-- Who approved what?
select * from ChangeApproval;
select * from Engineers;
select * from ChangeRequest;
select e.EngineerName,e.Department,cr.Description,ca.ApprovalDate from Engineers as e
inner join ChangeApproval as ca on e.EngineerID=ca.EngineerID
inner join ChangeRequest as cr on ca.ChangeID=cr.ChangeID;

-- Number of approvals by each engineer
select e.EngineerName,e.Department,count(ca.ChangeID) as Total_Approved from Engineers as e
inner join ChangeApproval as ca on e.EngineerID=ca.EngineerID
group by EngineerName,Department;

-- Which product is most complex?
select top 1 p.ProductName, sum(b.Quantity) as Total_Quanitity from Product as p
inner join BOM as b on p.ProductID=b.ProductID
group by ProductName
order by Total_Quanitity desc;

-- Which parts are never modified?
select * from Component;
select * from ChangeRequest;
select ComponentName from Component
where ComponentID not in (select ComponentID from ChangeRequest);

-- The parts that have both revisions and engineering changes:-
select distinct c.ComponentName from Component as c
inner join Revision as r on c.ComponentID=r.ComponentID
inner join ChangeRequest as cr on c.ComponentID=cr.ComponentID;

-- Where are products in lifecycle?
select LifecycleStage, count(*) as ProductCount from  Product
group by LifecycleStage;