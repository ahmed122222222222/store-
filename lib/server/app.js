var paypal=require('paypal-rest-sdk');
var express=require('express') ;
var app=express;
paypal.configure({
    'mode': 'sandbox', //sandbox or live
    'client_id': 'AX4mN8gX_4CkqVnFMpgltQChTxZNqF5WQ4po1MXSF_hxYAr8cx6YkFY1AWPUGuVWUujBcR748WHJ7BXT',
    'client_secret': 'EKlLSNbvVgvKai-_9zXQdboUM2KxyF8NtGpHORaoI8kg-fRIzBqqvtM80YARSlpHXUgK8_HT4qmDck-t'
  });
app.get('/pay',(req,res)=>{
    var create_payment_json = {
        "intent": "sale",
        "payer": {
            "payment_method": "paypal"
        },
        "redirect_urls": {
            "return_url": "http://return.url",
            "cancel_url": "http://cancel.url"
        },
        "transactions": [{
            "item_list": {
                "items": [{
                    "name": "item",
                    "sku": "item",
                    "price": "1.00",
                    "currency": "USD",
                    "quantity": 10
                }]
            },
            "amount": {
                "currency": "USD",
                "total": "100"
            },
            "description": "This is the payment description."
        }]
    };
})


paypal.payment.create(create_payment_json,  (error, payment)=> {
    if (error) {
        throw error;
    } else {
        console.log("Create Payment Response");
        console.log(payment);
        for(let i=0;i<=payment.links.length;i++)
        {
            if(payment.links[i].rel=='approval_url ')
            {
                res.redirect(payment.links[i].href);
            }
        }
    }
});
app.get('/',req,res =>{
res.send('send server js');

})

app.listen(8000,(res,req)=>{
    console.log('server started up');
})