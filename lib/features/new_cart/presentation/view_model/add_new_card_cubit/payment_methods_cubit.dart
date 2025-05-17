import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/payment_card_model.dart';

part 'payment_methods_state.dart';

class PaymentMethodsCubit extends Cubit<PaymentMethodsState> {
  PaymentMethodsCubit() : super(PaymntMethodsInitial());

  String? selectedPaymentId;
  List<PaymentCardModel> _paymentCards = List.from(dummyPaymentCards);

  Future<void> addNewCard(String cardNumber, String cardHolderName,
      String expiryDate, String cvv) async {
    emit(AddNewCardLoading());
    try {
      final newCard = PaymentCardModel(
        id: DateTime.now().toIso8601String(),
        cardNumber: cardNumber,
        cardHolderName: cardHolderName,
        expiryDate: expiryDate,
        cvv: cvv,
      );
      _paymentCards.add(newCard);
      emit(AddNewCardSuccess());
    } catch (e) {
      emit(AddNewCardFailure(e.toString()));
    }
  }

  Future<void> fetchPaymentMethods() async {
    emit(FetchingPaymentMethods());
    try {
      final paymentCards = _paymentCards;
      emit(FetchedPaymentMethods(paymentCards));
      if (paymentCards.isNotEmpty) {
        final chosenPaymentMethod = paymentCards.firstWhere(
              (element) => element.isChosen,
          orElse: () => paymentCards.first,
        );
        selectedPaymentId = chosenPaymentMethod.id;
        emit(PaymentMethodChosen(chosenPaymentMethod));
      }
    } catch (e) {
      emit(FetchPaymentMethodsError(e.toString()));
    }
  }

  Future<void> changePaymentMethod(String id) async {
    selectedPaymentId = id;
    try {
      final tempChosenPaymentMethod =
      _paymentCards.firstWhere((card) => card.id == id);
      emit(PaymentMethodChosen(tempChosenPaymentMethod));
    } catch (e) {
      emit(FetchPaymentMethodsError(e.toString()));
    }
  }

  Future<void> confirmPaymentMethod() async {
    emit(ConfirmPaymentLoading());
    try {
      // إلغاء التحديد السابق
      final index = _paymentCards.indexWhere((card) => card.isChosen);
      if (index != -1) {
        _paymentCards[index] = _paymentCards[index].copyWith(isChosen: false);
      }

      // تعيين البطاقة المختارة
      final newIndex =
      _paymentCards.indexWhere((card) => card.id == selectedPaymentId);
      if (newIndex != -1) {
        _paymentCards[newIndex] =
            _paymentCards[newIndex].copyWith(isChosen: true);
      }

      emit(ConfirmPaymentSuccess());
    } catch (e) {
      emit(ConfirmPaymentFailure(e.toString()));
    }
  }
}
