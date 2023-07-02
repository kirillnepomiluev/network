import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';

class UtilsLocale {

  static String getLevelText(int level, BuildContext context) => level<1? AppString.of(context).haveNotCostume : '${AppString.of(context).level} $level';

  static String getStatusText(String status, BuildContext context) {
    String statusText = '';

    switch (status) {
      case 'created':
        statusText = AppString.of(context).meetingCreated;
        break;
      case 'cancelled':
        statusText = AppString.of(context).meetingCancelled;
        break;
      case 'expired':
        statusText = AppString.of(context).meetingExpired;
        break;
      case 'accepted':
        statusText = AppString.of(context).meetingAccepted;
        break;
      case 'rejected':
        statusText = AppString.of(context).meetingRejected;
        break;
      case 'active':
        statusText = AppString.of(context).meetingActive;
        break;
      case 'interrupted':
        statusText = AppString.of(context).meetingInterrupted;
        break;
      case 'done':
        statusText = AppString.of(context).meetingDone;
        break;
    }

    return statusText;
  }
  
}

