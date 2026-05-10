import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:mobile_project/features/profile/data/models/payment_method_model.dart';

class PaymentMethodsView extends StatefulWidget {
  const PaymentMethodsView({super.key});

  @override
  State<PaymentMethodsView> createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getPaymentMethods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      appBar: AppBar(
        title: const Text('Payment Methods'),
        elevation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PaymentMethodsSuccess) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.methods.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final method = state.methods[index];
                      return _buildPaymentCard(method);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Add New Card'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7A00),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ProfileFailure) {
            return Center(child: Text(state.errMessage));
          }
          return const Center(child: Text('No payment methods found.'));
        },
      ),
    );
  }

  Widget _buildPaymentCard(PaymentMethodModel method) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: method.isDefault ? const Color(0xFF251912) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 40,
            decoration: BoxDecoration(
              color: method.isDefault ? Colors.white.withOpacity(0.1) : const Color(0xFFFFF1EA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              method.type == 'Visa' ? Icons.credit_card : Icons.payments,
              color: method.isDefault ? Colors.white : const Color(0xFFFF7A00),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${method.type} •••• ${method.lastFour}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: method.isDefault ? Colors.white : const Color(0xFF251912),
                  ),
                ),
                Text(
                  'Expires ${method.expiryDate}',
                  style: TextStyle(
                    fontSize: 12,
                    color: method.isDefault ? Colors.white.withOpacity(0.7) : const Color(0xFF5F5E5E),
                  ),
                ),
              ],
            ),
          ),
          if (method.isDefault)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFF7A00),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'DEFAULT',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
