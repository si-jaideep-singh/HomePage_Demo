//
//  FirebaseStaticTexts.swift
//  Lucknow Super Giants
//
//  Created by Abhijeet Gawde on 04/03/23.
//

import Foundation

struct FirebaseStaticTexts: Codable {
    
    var login_title: String?
    var login_sub_title: String?
    var login_mobile_hint: String?
    var login_send_otp_button: String?
    var otp_title: String?
    var otp_send_on: String?
    var otp_did_not_receive: String?
    var otp_resend_button: String?
    var login_disclaimer: String?
    var login_privacy_policay: String?
    var otp_verify_button: String?
    var incomplete_title: String?
    var incomplete_sub_title: String?
    var incomplete_first_name_hint: String?
    var incomplete_last_name_hint: String?
    var incomplete_email_hint: String?
    var incomplete_email_verify_button: String?
    var incomplete_mobile_hint: String?
    var incomplete_dob_hint: String?
    var incomplete_gender_hint: String?
    var incomplete_gender_male: String?
    var incomplete_gender_female: String?
    var incomplete_gender_other: String?
    var incomplete_favorite_player: String?
    var incomplete_jersey_name: String?
    var incomplete_jersey_no: String?
    var incomplete_profile_content: String?
    var incomplete_yes: String?
    var incomplete_no: String?
    var incomplete_submit_button: String?
    var signup_occasional_offer_agree: String?
    var disclaimer_error_ms: String?
    var terms_condition_error_ms: String?
    var signup_occasional_offer_disagree: String?
    var signup_occasional_offer_alert_text: String?
    var profile_disclaimer_text_android: String?
    var profile_ack_text_android: String?
    var input_error_invalid_email: String?
    var input_error_empty_password: String?
    var incomplete_verify_email_ms: String?
    var checkEmail_page_title: String?
    var checkEmail_message_text: String?
    var checkEmail_ok_button_title: String?
    var google_web_client_id: String?
    var profile_picture_size: String?
    var standing_title: String?
    var filter_squad_title: String?
    var filter_standing_title: String?
    var input_error_input_empty_field: String?
    var success_profile_update_text: String?
    var player_bio_text: String?
    var user_account_delete_request_massage: String?
    var buy_ticket: String?
    var match_center: String?
    var highlight: String?
    var match_report: String?
    var fixtures: String?
    var standings: String?
    var about_fan_loyalty_text: String?
    var about_fan_loyalty_dis_text: String?
    var redeem_btn: String?
    var faqs_btn: String?
    var earn_info_text: String?
    var earn_info_dis_text: String?
    var earn_point_text: String?
    var reward_text: String?
    var reward_dis_text: String?
    var news_navigation_title: String?
    var videos_navigation_title: String?
    var photos_navigation_title: String?
    var latest_news_label: String?
    var other_videos_label: String?
    var login_nav_title: String?
    var login_earn_points_text: String?
    var login_email_label: String?
    var login_email_hint: String?
    var login_pass_label: String?
    var login_pass_hint: String?
    var login_forgot_pass_label: String?
    var login_or: String?
    var login_do_not_have_an_acc: String?
    var view_all: String?
    var vote_now: String?
    var thank_you_for_you: String?
    var fixtures_and_results: String?
    var filter: String?
    var cancel: String?
    var clear_filter: String?
    var apply_filter: String?
    var last_5_matches: String?
    var team: String?
    var players: String?
    var support_staff: String?
    var know_more: String?
    var born: String?
    var nationality: String?
    var batting_style: String?
    var ipl_debut: String?
    var bio: String?
    var stats: String?
    var ipl_statistics: String?
    var t_20_i_statistics: String?
    var select_year: String?
    var batting_and_fielding: String?
    var bowling: String?
    var overall: String?
    var back: String?
    var you_can_redeem_: String?
    var copy_code: String?
    var steps_to_redeem: String?
    var terms_and_conditions: String?
    var step: String?
    var order_confirmed: String?
    var your_order_is_: String?
    var okay: String?
    var something_went_wrong: String?
    var fan_loyalty_transaction_time_zone: String?
    var SIGN_UP: String?
    var UPDATE_COMPLETE_USER_PROFILE: String?
    var VIDEO_WATCHED: String?
    var ARTICLE_READ: String?
    var BIRTHDAY: String?
    var PARTICIPATE_POLLS: String?
    var PARTICIPATE_QUIZ: String?
    var USER_COMMENT: String?
    var ACHIEVEMENT_UNLOCKED: String?
    var MEDIA_APPROVED: String?
    var BLOG_APPROVED: String?
    var STEPS_LOGGED: String?
    var PEPPO_VOUCHERS_BURN: String?
    var PEPPO_REFUND: String?
    var REDUCE: String?
    var REFERRAL: String?
    var message_dont_have_enough_point: String?
    var more: String?
    var signup_nav_title: String?
    var signup_fname_label: String?
    var signup_fname_hint: String?
    var signup_lname_label: String?
    var signup_lname_hint: String?
    var signup_email_label: String?
    var signup_email_hint: String?
    var signup_password_label: String?
    var signup_password_tooltip_hint: String?
    var signup_password_hint: String?
    var signup_confirm_password_label: String?
    var signup_confirm_password_tooltip_hint: String?
    var signup_confirm_password_hint: String?
    var signup_mob_no_label: String?
    var signup_mob_no_hint: String?
    var signup_btn: String?
    var login_welcome_title: String?
    var login_btn: String?
    var login_do_not_have_an_acc_sign_up: String?
    var skip: String?
    var info_term_and_con: String?
    var btn_proceed: String?
    var voucher_code: String?
    var order_failed: String?
    var flp_form_first_name: String?
    var flp_form_enter_your_first_name: String?
    var flp_form_last_name: String?
    var flp_form_enter_your_last_name: String?
    var flp_form_email_address: String?
    var flp_form_enter_your_email_address: String?
    var flp_form_mobile_number: String?
    var flp_form_enter_your_mobile_number: String?
    var flp_form_address: String?
    var flp_form_enter_your_complete_address: String?
    var flp_form_country: String?
    var flp_form_state: String?
    var flp_form_enter_your_state_name: String?
    var flp_form_city: String?
    var flp_form_enter_your_city_name: String?
    var flp_form_zip_code: String?
    var flp_form_cancel: String?
    var flp_form_confirm_to_claim_voucher: String?
    var login_password_tooltip_hint: String?
    var notification_title: String?
    var profile_first_name: String?
    var profile_enter_your_first_name: String?
    var profile_last_name: String?
    var profile_enter_your_last_name: String?
    var profile_email_address: String?
    var profile_enter_your_email_address: String?
    var profile_mobile_number: String?
    var profile_enter_your_mobile_number: String?
    var profile_address: String?
    var profile_enter_your_complete_address: String?
    var profile_country: String?
    var profile_state: String?
    var profile_enter_your_state_name: String?
    var profile_city: String?
    var profile_enter_your_city_name: String?
    var profile_zip_code: String?
    var profile_cancel: String?
    var navigation_title_fixtures_and_results: String?
    var toast_login_required_for_feature: String?
    var title_latest_updates: String?
    var squad_pl_fname: String?
    var squad_pl_lname: String?
    var squad_pl_role: String?
    var squad_pl_countryName: String?
    var squad_pl_matches_played: String?
    var squad_pl_most_runs: String?
    var squad_pl_highest_score: String?
    var squad_pl_strike_rate: String?
    var squad_pl_know_more_btn: String?
    var squad_pl_view_profile_btn: String?
    var squadDetails_pl_fname: String?
    var squadDetails_pl_lname: String?
    var squadDetails_pl_role: String?
    var squadDetails_pl_born: String?
    var squadDetails_pl_nationality: String?
    var squadDetails_pl_batting_style: String?
    var squadDetails_pl_ipl_debut: String?
    var squadDetails_pl_bio_btn: String?
    var squadDetails_pl_stats_btn: String?
    var squadDetails_pl_ipl_statistics_btn: String?
    var squadDetails_pl_t20i_stats_btn: String?
    var squadDetails_pl_no_results_found: String?
    var squadDetails_pl_select_year: String?
    var squad_players_btn: String?
    var squad_support_staff_btn: String?
    var flp_coin_label :String?
    var earn_point : String?
    var balance_point : String?
    var profile_balance_point : String?
    var profile_label_text : String?
    var earn_info_text_ios : String?
    var profile_earn_points_title : String?
    var REFUND : String?
    var OUTCOME_MATCH_PREDICTION: String?
    var PREDICTOR_LEADER : String?
    var MATCH_PREDICTION : String?
    var VIEW_PHOTO_GALLERY : String?
    var NEWSLETTER_SUBSCRIPTION : String?
    var UPDATE_PROFILE : String?
    var VOTE_ON_POLLS : String?
   




}

