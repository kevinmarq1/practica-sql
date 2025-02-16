alter table keepcoding.ivr_calls
add column info_by_phone_lg int;
update keepcoding.ivr_calls c
set info_by_phone_lg= (
  select if(count(*) > 0,1,0)
  from keepcoding.ivr_detail d
  where c.ivr_id = d.calls_ivr_id
  and d.step_name = 'CUSTOMERINFOBYPHONE.TX'
  and d.step_result = "OK"
)
where c.ivr_id is not null;
