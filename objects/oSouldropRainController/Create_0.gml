tiers=[
{d:-5000,sc:0,rate:24},
{d:-4,sc:0.4,rate:10},
{d:-3,sc:0.6,rate:5},
{d:20,sc:0.8,rate:3}
];
count=array_create(array_length(tiers));

if !eventExistsDefault(x,y) eventAddObjectDefault(x,y);