local ls = require("luasnip")
local extras = require("luasnip.extras")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = extras.rep

return {
  s("riverpodPart", {
    t("part '"), f(function() return vim.fn.expand("%:t:r") end), t(".g.dart';"),
  }),

  s("riverpod", {
    t("@riverpod"),
    t({"", ""}), i(1), t(" "), i(2), t("("), f(function(args) return args[1][1]:gsub("^%l", string.upper) end, {2}), t("Ref ref) {"),
    t({"", "\treturn "}), i(3), t(";"),
    t({"", "}"}),
  }),

  s("riverpodKeepAlive", {
    t("@Riverpod(keepAlive: true)"),
    t({"", ""}), i(1), t(" "), i(2), t("("), f(function(args) return args[1][1]:gsub("^%l", string.upper) end, {2}), t("Ref ref) {"),
    t({"", "\treturn "}), i(3), t(";"),
    t({"", "}"}),
  }),

  s("riverpodFuture", {
    t("@riverpod"),
    t({"", "FutureOr<"}), i(1), t("> "), i(2), t("("), f(function(args) return args[1][1]:gsub("^%l", string.upper) end, {2}), t("Ref ref) {"),
    t({"", "\treturn "}), i(3), t(";"),
    t({"", "}"}),
  }),

  s("riverpodFutureKeepAlive", {
    t("@Riverpod(keepAlive: true)"),
    t({"", "FutureOr<"}), i(1), t("> "), i(2), t("("), f(function(args) return args[1][1]:gsub("^%l", string.upper) end, {2}), t("Ref ref) {"),
    t({"", "\treturn "}), i(3), t(";"),
    t({"", "}"}),
  }),

  s("riverpodStream", {
    t("@riverpod"),
    t({"", "Stream<"}), i(1), t("> "), i(2), t("("), f(function(args) return args[1][1]:gsub("^%l", string.upper) end, {2}), t("Ref ref) {"),
    t({"", "\treturn "}), i(3), t(";"),
    t({"", "}"}),
  }),

  s("riverpodStreamKeepAlive", {
    t("@Riverpod(keepAlive: true)"),
    t({"", "Stream<"}), i(1), t("> "), i(2), t("("), f(function(args) return args[1][1]:gsub("^%l", string.upper) end, {2}), t("Ref ref) {"),
    t({"", "\treturn "}), i(3), t(";"),
    t({"", "}"}),
  }),

  s("riverpodClass", {
    t("@riverpod"),
    t({"", "class "}), i(1), t(" extends _$"), rep(1), t(" {"),
    t({"", "\t@override", "\t"}), i(2), t(" build() {"),
    t({"", "\t\treturn "}), i(3), t(";"),
    t({"", "\t}", "}"}),
  }),

  s("riverpodClassKeepAlive", {
    t("@Riverpod(keepAlive: true)"),
    t({"", "class "}), i(1), t(" extends _$"), rep(1), t(" {"),
    t({"", "\t@override", "\t"}), i(2), t(" build() {"),
    t({"", "\t\treturn "}), i(3), t(";"),
    t({"", "\t}", "}"}),
  }),

  s("riverpodAsyncClass", {
    t("@riverpod"),
    t({"", "class "}), i(1), t(" extends _$"), rep(1), t(" {"),
    t({"", "\t@override", "\tFutureOr<"}), i(2), t("> build() {"),
    t({"", "\t\treturn "}), i(3), t(";"),
    t({"", "\t}", "}"}),
  }),

  s("riverpodAsyncClassKeepAlive", {
    t("@Riverpod(keepAlive: true)"),
    t({"", "class "}), i(1), t(" extends _$"), rep(1), t(" {"),
    t({"", "\t@override", "\tFutureOr<"}), i(2), t("> build() {"),
    t({"", "\t\treturn "}), i(3), t(";"),
    t({"", "\t}", "}"}),
  }),

  s("riverpodStreamClass", {
    t("@riverpod"),
    t({"", "class "}), i(1), t(" extends _$"), rep(1), t(" {"),
    t({"", "\t@override", "\tStream<"}), i(2), t("> build() {"),
    t({"", "\t\treturn "}), i(3), t(";"),
    t({"", "\t}", "}"}),
  }),

  s("riverpodStreamClassKeepAlive", {
    t("@Riverpod(keepAlive: true)"),
    t({"", "class "}), i(1), t(" extends _$"), rep(1), t(" {"),
    t({"", "\t@override", "\tStream<"}), i(2), t("> build() {"),
    t({"", "\t\treturn "}), i(3), t(";"),
    t({"", "\t}", "}"}),
  }),

  s("consumer", {
    t("Consumer("),
    t({"", "\tbuilder: (context, ref, child) {"}),
    t({"", "\t\treturn "}), i(1),
    t({";", "\t},", ");"}),
  }),

  s("stlessConsumer", {
    t("class "), i(1, "MyWidget"), t(" extends ConsumerWidget {"),
    t({"", "\tconst "}), rep(1), t("({super.key});"),
    t({"", "\t@override", "\tWidget build(BuildContext context, WidgetRef ref) {"}),
    t({"", "\t\treturn Container();", "\t}", "}"}),
  }),

  s("stfulConsumer", {
    t("class "), i(1, "MyWidget"), t(" extends ConsumerStatefulWidget {"),
    t({"", "\tconst "}), rep(1), t("({super.key});"),
    t({"", "\t@override", "\tConsumerState<"}), rep(1), t("> createState() => _"), rep(1), t("State();"),
    t({"", "}", "", "class _"}), rep(1), t("State extends ConsumerState<"), rep(1), t("> {"),
    t({"", "\t@override", "\tWidget build(BuildContext context) {"}),
    t({"", "\t\treturn Container();", "\t}", "}"}),
  }),

  s("stlessWidget", {
    t("class "), i(1, "MyWidget"), t(" extends StatelessWidget {"),
    t({"", "\tconst "}), rep(1), t("({super.key});"),
    t({"", "\t@override", "\tWidget build(BuildContext context) {"}),
    t({"", "\t\treturn Container();", "\t}", "}"}),
  }),

  s("frezdpts", {
    t("part '"), f(function() return vim.fn.expand("%:t:r") end), t(".g.dart';"),
  }),

  s("frezdptf", {
    t("part '"), f(function() return vim.fn.expand("%:t:r") end), t(".freezed.dart';"),
  }),

  s("frezd", {
    t("@freezed"),
    t({"", "abstract class "}), i(1, "DataClass"), t(" with _$"), rep(1), t(" {"),
    t({"", "  const factory "}), rep(1), t("("), i(2), t(") = _"), rep(1), t(";"),
    t({"", "  factory "}), rep(1), t(".fromJson(Map<String, dynamic> json) => _$"), rep(1), t("FromJson(json);"),
    t({"", "}"}),
  }),

  s("frezdunion", {
    t("@freezed"),
    t({"", "abstract class "}), i(1, "Union"), t(" with _$"), rep(1), t(" {"),
    t({"", "  const factory "}), rep(1), t("."), i(2), t("("), i(4), t(") = "), i(3), t(";"),
    t({"", "}"}),
  }),

  s("frezdunioncase", {
    t("const factory "), i(1, "Union"), t("."), i(2), t("("), i(4), t(") = "), i(3), t(";"),
  }),

  s("frezdfromjson", {
    t("factory "), i(1), t(".fromJson(Map<String, dynamic> json) => _$"), rep(1), t("FromJson(json);"),
  }),

  s("stlessHookConsumer", {
    t("class "), i(1, "MyWidget"), t(" extends HookConsumerWidget {"),
    t({"", "\tconst "}), rep(1), t("({super.key});"),
    t({"", "\t@override", "\tWidget build(BuildContext context, WidgetRef ref) {"}),
    t({"", "\t\treturn Container();", "\t}", "}"}),
  }),

  s("stfulHookConsumer", {
    t("class "), i(1, "MyWidget"), t(" extends StatefulHookConsumerWidget {"),
    t({"", "\tconst "}), rep(1), t("({super.key});"),
    t({"", "\t@override", "\tConsumerState<ConsumerStatefulWidget> createState() => _"}), rep(1), t("State();"),
    t({"", "}", "", "class _"}), rep(1), t("State extends ConsumerState<"), rep(1), t("> {"),
    t({"", "\t@override", "\tWidget build(BuildContext context) {"}),
    t({"", "\t\treturn Container();", "\t}", "}"}),
  }),

  s("listen", {
    t("ref.listen<"), i(1), t(">("), i(2), t(", (previous, next) {"),
    t({"", "\t"}), i(3),
    t({"", "});"}),
  }),
}
