drop table daily_merchant_transaction_activity;

create table daily_merchant_transaction_activity as
with payment_and_attributed_refund as (
select
  payments.created,
  payments.merchant,
  sum(payments.amount) as payment_volume,
  sum(1) as payment_count,
  sum(refunds.amount) as refunded_volume,
  sum(case when refunds.id is not null then 1 end) as refund_count
from payments
left join refunds on refunds.payment = payments.id
group by 1,2
),
booked_refunds as (
select
  refunds.created,
  refunds.merchant,
  sum(refunds.amount) as booked_refunded_volume,
  sum(1) as booked_refund_count
from refunds
group by 1,2
)

select
  par.created,
  par.merchant,
  par.payment_volume,
  par.payment_count,
  par.refunded_volume,
  par.refund_count,
  br.booked_refunded_volume,
  br.booked_refund_count,
  par.payment_volume + br.booked_refunded_volume as net_processing_volume
from payment_and_attributed_refund par
join booked_refunds br on par.created = br.created and par.merchant = br.merchant
;
