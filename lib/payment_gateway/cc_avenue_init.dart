import 'package:cc_avenue/cc_avenue.dart';
import 'package:greymatter/payment_gateway/payment_keys.dart';

class CCAvenueInit {
  startPayment({required String bookingId, required String amount}) {
    CcAvenue.cCAvenueInit(
        transUrl: 'https://test.ccavenue.com/transaction/initTrans',
        accessCode: accessCode,
        amount: amount,
        cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
        currencyType: 'INR',
        merchantId: merchantId,
        orderId: bookingId,
        redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
        rsaKeyUrl: 'https://test.ccavenue.com/transaction/jsp/GetRSA.jsp');
  }
}
