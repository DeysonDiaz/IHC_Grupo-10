import 'package:flutter/material.dart';
import 'package:music_fit/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_fit/blocs/preferences_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:music_fit/main.dart';

class Language extends StatefulWidget {
  const Language({Key key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    final preferencesBloc = context.bloc<PreferencesBloc>();
    return new Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 75.0, left: 20.0, right: 20.0),
        child: Text(
          AppLocalizations.of(context).selectionlanguage,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 30,
          ),
        ),
      ),
      SizedBox(height: 50),
      ExpansionListCard<Locale>(
        title: AppLocalizations.of(context).language,
        subTitle: _localizeLocale(context, preferencesBloc.state.locale),
        leading: Icon(Icons.language, size: 48),
        items: [
          null,
          ...AppLocalizations.delegate.supportedLocales,
        ],
        itemBuilder: (locale) {
          return ExpansionCardItem(
            text: _localizeLocale(context, locale),
            onTap: () => preferencesBloc.add(ChangeLocale(locale)),
          );
        },
      ),
      SizedBox(height: 50.0),
      Container(
        height: 40.0,
        width: 200,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.greenAccent,
          color: Colors.green,
          elevation: 7.0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            child: Center(
              child: Text(
                AppLocalizations.of(context).Continue,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ),
        ),
      ),
    ])));
  }

  String _localizeLocale(BuildContext context, Locale locale) {
    if (locale == null) {
      return AppLocalizations.of(context).systemLanguage;
    } else {
      final localeString = LocaleNames.of(context).nameOf(locale.toString());
      return localeString[0].toUpperCase() + localeString.substring(1);
    }
  }
}

class ExpansionListCard<T> extends StatelessWidget {
  const ExpansionListCard({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.leading,
    @required this.items,
    @required this.itemBuilder,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Widget leading;
  final List<T> items;
  final ExpansionCardItem Function(T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth >= 350.0 ? 350.0 : constraints.maxWidth,
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          child: _ExpansionCardBase(
            borderRadius: BorderRadius.circular(4.0),
            leading: leading,
            title: Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(fontSize: 14),
            ),
            builder: (toggleExpansion) {
              return ListView.separated(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                separatorBuilder: (context, index) => Divider(height: 1.0),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = itemBuilder(items[index]);
                  return ListTile(
                    key: item.key,
                    title: Text(item.text),
                    onTap: () {
                      toggleExpansion();
                      item.onTap?.call();
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class ExpansionCardItem {
  const ExpansionCardItem({
    this.key,
    @required this.text,
    @required this.onTap,
  });
  final Key key;
  final String text;
  final VoidCallback onTap;
}

class _ExpansionCardBase extends StatefulWidget {
  const _ExpansionCardBase({
    Key key,
    this.leading,
    @required this.title,
    this.subtitle,
    this.onExpansionChanged,
    this.builder,
    this.trailing,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.elevation = 2.0,
    this.initiallyExpanded = false,
    this.initialPadding = EdgeInsets.zero,
    this.finalPadding = const EdgeInsets.symmetric(vertical: 6.0),
    this.contentPadding,
    this.baseColor,
    this.expandedColor,
    this.duration = const Duration(milliseconds: 200),
    this.elevationCurve = Curves.easeOut,
    this.heightFactorCurve = Curves.easeIn,
    this.turnsCurve = Curves.easeIn,
    this.colorCurve = Curves.easeIn,
    this.paddingCurve = Curves.easeIn,
  })  : assert(initiallyExpanded != null),
        super(key: key);

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final ValueChanged<bool> onExpansionChanged;
  final Widget Function(VoidCallback toggleExpansion) builder;
  final Widget trailing;
  final BorderRadiusGeometry borderRadius;
  final double elevation;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry initialPadding;
  final EdgeInsetsGeometry finalPadding;
  final EdgeInsetsGeometry contentPadding;
  final Color baseColor;
  final Color expandedColor;
  final Duration duration;
  final Curve elevationCurve;
  final Curve heightFactorCurve;
  final Curve turnsCurve;
  final Curve colorCurve;
  final Curve paddingCurve;

  @override
  _ExpansionCardBaseState createState() => _ExpansionCardBaseState();
}

class _ExpansionCardBaseState extends State<_ExpansionCardBase>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _materialColorTween = ColorTween();
  EdgeInsetsTween _edgeInsetsTween;
  Animatable<double> _elevationTween;
  Animatable<double> _heightFactorTween;
  Animatable<double> _turnsTween;
  Animatable<double> _colorTween;
  Animatable<double> _paddingTween;

  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;
  Animation<double> _elevation;
  Animation<Color> _headerColor;
  Animation<Color> _iconColor;
  Animation<Color> _materialColor;
  Animation<EdgeInsets> _padding;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _edgeInsetsTween = EdgeInsetsTween(
      begin: widget.initialPadding,
      end: widget.finalPadding,
    );
    _elevationTween = CurveTween(curve: widget.elevationCurve);
    _heightFactorTween = CurveTween(curve: widget.heightFactorCurve);
    _colorTween = CurveTween(curve: widget.colorCurve);
    _turnsTween = CurveTween(curve: widget.turnsCurve);
    _paddingTween = CurveTween(curve: widget.paddingCurve);

    _controller = AnimationController(duration: widget.duration, vsync: this);
    _heightFactor = _controller.drive(_heightFactorTween);
    _iconTurns = _controller.drive(_halfTween.chain(_turnsTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_colorTween));
    _materialColor = _controller.drive(_materialColorTween.chain(_colorTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_colorTween));
    _elevation = _controller.drive(
        Tween<double>(begin: 0.0, end: widget.elevation)
            .chain(_elevationTween));
    _padding = _controller.drive(_edgeInsetsTween.chain(_paddingTween));
    _isExpanded = PageStorage.of(context)?.readState(context) as bool ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    _handleTap();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20.0, right: 20.0),
      child: Material(
        type: MaterialType.card,
        color: _materialColor.value,
        borderRadius: widget.borderRadius,
        elevation: _elevation.value,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                customBorder:
                    RoundedRectangleBorder(borderRadius: widget.borderRadius),
                onTap: _handleTap,
                child: ListTileTheme.merge(
                  iconColor: _iconColor.value,
                  textColor: _headerColor.value,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: ListTile(
                      contentPadding: widget.contentPadding,
                      leading: widget.leading,
                      title: widget.title,
                      subtitle: widget.subtitle,
                      trailing: widget.trailing ??
                          RotationTransition(
                            turns: _iconTurns,
                            child: const Icon(Icons.expand_more),
                          ),
                    ),
                  ),
                ),
              ),
              ClipRect(
                child: Align(
                  heightFactor: _heightFactor.value,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _headerColorTween
      ..begin = theme.textTheme.subtitle1.color
      ..end = theme.accentColor;
    _iconColorTween
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;
    _materialColorTween
      ..begin = widget.baseColor ?? theme.canvasColor
      ..end = widget.expandedColor ?? theme.cardColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : widget.builder(_toggleExpansion) ?? SizedBox(),
    );
  }
}
