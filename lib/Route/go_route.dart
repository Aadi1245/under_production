import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

// Track if a deep link has already been handled
bool _isDeepLinkHandled = false;

/// This handles '/' and '/details'.
var goRouter = GoRouter(routes: []);
