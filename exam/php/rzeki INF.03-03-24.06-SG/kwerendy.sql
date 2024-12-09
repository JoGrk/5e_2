select nazwa,rzeka, stanAlarmowy from wodowskazy;
select nazwa, rzeka, stanOstrzegawczy, stanAlarmowy 
from wodowskazy
inner join pomiary
 on pomiary.wodowskazy_id = wodowskazy.id
where dataPomiaru = '2022-05-05';

select nazwa, rzeka, stanOstrzegawczy, stanAlarmowy 
from wodowskazy
inner join pomiary
 on pomiary.wodowskazy_id = wodowskazy.id
where dataPomiaru = '2022-05-05'
and stanWody > stanOstrzegawczy;

select dataPomiaru, avg(stanWody) 
from pomiary
group by dataPomiaru;

