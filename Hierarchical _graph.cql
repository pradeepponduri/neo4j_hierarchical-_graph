//Let's create the top of the tree, the PRODUCT
create (n1:PRODUCT {id:1});

//Let's create 100 children of the PRODUCT, COST_GROUPS connected to the top of the tree
match (n1:PRODUCT {id:1})
with range(1,10) as RANGE, n1
foreach (r in RANGE | create (n2:COST_GROUP {id:r})-[:PART_OF {quantity:round(rand()*100)}]->(n1) );

//for every COST_GROUP, let's connect 100 children at a 3rd level, the COST_TYPEs
match (n2:COST_GROUP)
with range(1,100) as RANGE, n2
foreach (r in RANGE | create (n3:COST_TYPE {id:r})-[:PART_OF {quantity:round(rand()*100)}]->(n2) );

//for every COST_TYPE, connect 10 COST_SUBTYPEs 
match (n3:COST_TYPE)
with range(1,10) as RANGE, n3
foreach (r in RANGE | create (n4:COST_SUBTYPE {id:r})-[:PART_OF {quantity:round(rand()*100)}]->(n3) );

//for every COST_SUBTYPE, connect 5 different COSTs
match (n4:COST_SUBTYPE)
with range(1,5) as RANGE, n4
foreach (r in RANGE | create (n5:COST {id:r})-[:PART_OF {quantity:round(rand()*100)}]->(n4) );


//for every COST, connect 3 COST_COMPONENTs
match (n5:COST)
create (n6:COST_COMPONENT {id:1,price:round(rand()*1000)})-[:PART_OF {quantity:round(rand()*100)}]->(n5);
match (n5:COST)
create (n6:COST_COMPONENT {id:2,price:round(rand()*1000)})-[:PART_OF {quantity:round(rand()*100)}]->(n5);
match (n5:COST)
create (n6:COST_COMPONENT {id:3,price:round(rand()*1000)})-[:PART_OF {quantity:round(rand()*100)}]->(n5);
