import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flutter/material.dart';

class JellyBeanMoreInfo extends StatefulWidget {
  const JellyBeanMoreInfo(
    this.jellyBean, {
    super.key,
  });

  final JellyBeanModel jellyBean;

  @override
  _JellyBeanMoreInfoState createState() => _JellyBeanMoreInfoState();
}

class _JellyBeanMoreInfoState extends State<JellyBeanMoreInfo> {
  int _currentPanelIndex = -1;

  Color get _expandedColor {
    return Color(
      int.parse(widget.jellyBean.backgroundColor.replaceFirst('#', '0xff')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: _currentPanelIndex,
      expansionCallback: (index, isExpanded) {
        setState(() => _currentPanelIndex = isExpanded ? -1 : index);
      },
      children: [
        _buildIngredientsPanel(),
        _buildMoreInfoPanel(),
      ],
    );
  }

  ExpansionPanelRadio _buildIngredientsPanel() {
    return ExpansionPanelRadio(
      value: 0,
      headerBuilder: (context, isExpanded) {
        return ListTile(
          leading: Icon(
            Icons.food_bank,
            color: isExpanded ? _expandedColor : null,
          ),
          title: const Text('Ingredients'),
        );
      },
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.jellyBean.ingredients.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.jellyBean.ingredients[index]),
            dense: true,
          );
        },
      ),
    );
  }

  ExpansionPanelRadio _buildMoreInfoPanel() {
    return ExpansionPanelRadio(
      value: 1,
      headerBuilder: (context, isExpanded) {
        return ListTile(
          leading: Icon(
            Icons.info,
            color: isExpanded ? _expandedColor : null,
          ),
          title: const Text('More Information'),
        );
      },
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildInfoTile('Sugar Free', widget.jellyBean.sugarFree),
          _buildInfoTile('Gluten Free', widget.jellyBean.glutenFree),
          _buildInfoTile('Kosher', widget.jellyBean.kosher),
          _buildInfoTile('Seasonal', widget.jellyBean.seasonal),
        ],
      ),
    );
  }

  ListTile _buildInfoTile(String title, bool value) {
    return ListTile(
      title: Text('$title: ${value ? 'Yes' : 'No'}'),
      dense: true,
    );
  }
}
