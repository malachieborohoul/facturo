

import 'package:facturo/features/client/services/client_service.dart';
import 'package:facturo/features/inventory/services/inventory_service.dart';
import 'package:facturo/features/invoice/services/invoice_service.dart';

String uri = "http://50.116.33.87:4000/business-lounge-api/v1";

const String qrcode = "6385e2e0ad3b73ad4d402699";

const String playfair = "Playfair Display";

const String sourceSans = "Source Sans 3";

ClientService clientService = ClientService();
InventoryService inventoryService = InventoryService();
InvoiceService invoiceService = InvoiceService();
