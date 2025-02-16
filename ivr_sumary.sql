create table keepcoding.ivr_summary as select
d.calls_ivr_id as ivr_id,
d.calls_phone_number as phone_number,
d.calls_ivr_result as ivr_result,
c.vdn_aggregation as vdn_aggregation,
d.calls_start_date as start_date,
d.calls_end_date as end_date,
d.calls_total_duration as total_duration,
d.calls_customer_segment as customer_segment,
d.calls_ivr_language as ivr_language,
d.calls_steps_module as steps_module,
d.calls_module_aggregation as module_aggregation,
d.document_type,
d.document_identification,
d.customer_phone,
d.billing_account_id,
c.masiva_lg,
c.info_by_phone_lg,
c.info_by_dni_lg,
c.repeated_phone_24H,
c.cause_recall_phone_24H
from
  keepcoding.ivr_detail d
join
  keepcoding.ivr_calls c
on
  d.calls_ivr_id = c.ivr_id
  where d.calls_ivr_id is not null;
