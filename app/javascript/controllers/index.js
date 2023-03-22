// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address-autocomplete", AddressAutocompleteController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import InquirySelectorController from "./inquiry_selector_controller"
application.register("inquiry-selector", InquirySelectorController)

import InquirySubscriptionController from "./inquiry_subscription_controller"
application.register("inquiry-subscription", InquirySubscriptionController)

import MapController from "./map_controller"
application.register("map", MapController)

import SearchBarController from "./search_bar_controller"
application.register("search-bar", SearchBarController)
