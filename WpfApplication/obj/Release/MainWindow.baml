   M S B A M L   `   `   `  ���� I  EWpfApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:WpfApplicationWpfApplication      WpfApplication.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:WpfApplication       � Title$  OSD Frontend 2016��$��577.839��$��442.956�����	#FF8B8B8B���	#FF7E7E7E$y�Visible=�   WindowStyle1#���   ��Z�  � 	Resources   SystemBackground  MenuItemControlTemplate1 �� 
TargetType ��Name J� SnapsToDevicePixels �Name � ColumnDefinitions ��Name m� Icon	 F�Name
 �� HeaderStringFormat �� ContentStringFormat �Name � AllowsTransparency �� RelativeSource �� Padding �� Color ��Name �� 
ResourceId �� TypeInTargetAssembly �� ClearTypeHint ��Name ��Name �� ElementName ��Name-  'System.Windows.Input.KeyboardNavigation   DirectionalNavigation � IsSharedSizeScope   TabNavigation �� Triggers P� Property P� Value �� 
TargetName  �� Property! �� Value" P� 
SourceName  Text  TextBlockStyle1# �� 
TargetType  WindowTemplateKey$ ��Name% ]� 
Conditions& �� Property' �� Value( �� Triggers  LabelStyle1��%  &	       &	      &	 �    &	 �    &	 �    &	  �    7  &	 �	    ��	#FF7E7E7E���� " m�.R��� $ templateRoot��#��z��#��z��#��z�� . ._�� $
 Grid��$��Center=� �� $
��Auto ��� $
��Auto �.+��� $
 Icon��#��z $
��Icon��$��Center=�$��16��$��3q�# z $��Center=�$��16��F� $	 
GlyphPanel��T������� �O �`�G �ڊ � �D �ڊ �    �XO � � �g5 ���A  ] ������� @    р�� �O #��z��$��LeftToRight=�$��3q�$y�	Collapsed=�$��Center=��� $ ContentPresenter��#��z��#��z��$��1��# z
 $��Header��#��z����. # z � $ 
PART_Popup�� . |�.  #��� -�$��Bottom=����� *IsSubmenuOpen+ �� *TemplatedParent+.���� $ SubMenuBorder�����	#FF999999$��1q�$ 2q����� # �  ._��� $ SubMenuScrollViewer����C� *�� $ MenuScrollViewer��" �+.��� $ Grid1��$ Enabled=�.+��� $ Canvas��$
��Left=�$��0��$	��Top=�$��0��.+��� $ 
OpaqueRect������ *
Background+$ SubMenuBorder������ *ActualHeight+$ SubMenuBorder������ *ActualWidth+$ SubMenuBorder���� $ 	Rectangle��$
��Left=�$��29,2,0,2q�$��1������ # �  �� $ ItemsPresenter��$ Cycle=� . # z $ Cycle=� P� " �@m�IsSuspendingPopupAnimation . . ��� $ 
PART_Popup��  � ��$
! None=�P�  Z�  �@m�Icon. ��� $
 Icon��  � y�$! 	Collapsed=�P�  �@m�	IsChecked . . ��� $ 
GlyphPanel��  � y�$! Visible=��� $
 Icon��  � y�$! 	Collapsed=�P�  �@m�IsHighlighted . . ��� $ templateRoot��  � ��! �	#3D26A0DA�� $ templateRoot��  � ��! �	#FF26A0DAP�  � {� .  . ��� $ templateRoot��  � ��! �	#FF707070�� $ 
GlyphPanel��  � ��! �	#FF707070P� $" SubMenuScrollViewer�� � �� .  . ��� $ 
OpaqueRect��! �� *VerticalOffset+$ SubMenuScrollViewer��  �@��Top�� $ 
OpaqueRect��! �� *HorizontalOffset+$ SubMenuScrollViewer��  �@��Left��	White���� "# ��.���   � ��$! NoWrap=���   � ��$
! None=��� " �.R��� #��z��#��z��#��z��._�� .+��� .u��� �� $$ WindowResizeGrip��$��Right=���.  $y�	Collapsed=�$��Bottom=� ]� % �� & �@�
ResizeMode$' CanResizeWithGrip=��� & �@�WindowState$' Normal=�./��� $ WindowResizeGrip��  � y�$! Visible=��� "# �.���   � ��#! � ����   � ��#! � ����   � ��! �� " �.R��� #��z��#��z��#��z��._��� .u��� ( P�  �@�
ResizeMode$ CanResizeWithGrip=�. ���   � ��8!   �� "# ��.���   � ��#! � ����   � ��
! ���� ��   � ��$! 5q���   � ��$
! Left=���   � ��$	! Top=���   � ��! �� " ��.R��� #��z��#��z��#��z��# z�� . ._��� #��z����. # z #��z�� P�  � {� .  . ��� #! � ��  � ��.��� $��24��$	��Top=�$��0,0,2,0q� �� $
��248* ��� $
��185* �.+�A� $��76.667��$��1.333,0,0.289,-131.667q�$��Bottom=�$��2��.+��� -   ) ��Name$) comboBox��$��0,24,-2,32.667q�
���   �o� -   * o�Name$
* menu��$��0,0,14,2.272q�$��2������ # �  .@�m� $
��File��
�������#���  ���� # �  .@�m� -   $��menuItemComputerName��$��Connect to server��
����������� # �  �� ���� # �  m� $��Offline��+ m� IsCheckable+ . ���� # �  �� m� $��Find computer object������ # �  �� m� $
��Save������ # �  m� $��Save as������ # �  m� -   $��menuItemExit��$
��Exit������ # �  m� $
��Edit��, J� OpacityMask
, �   �
�������#���  .@�m� $��Collection variables������ # �  m� $��Machine variables������ # �  � $��37.272��$��0,0,7.333,-36.667q�$��Bottom=�$��2��$��Right=�$��424.29��.+��� -   - ��Name$- label_ComputerName��
���   �#���  $��1q�$��9,4,0,5.272q�$
��Left=�$��179.167������ *ComputerName+. �� UpdateSourceTrigger$. Default=����� *
StartStyle+���� # �  � -   $��popUpConnect��$��0,0,176.315,13.272q�/ � ToolTip$1/ +Enter the configuration manager site server��.��� $	��101��$	��226�����	#FF9E9E9E.+��� -   0 ��Name$0 textBox��$��
41,36,42,0q�1 �� TextWrapping$
1 Wrap=�$��24��$	��Top=����� *
SiteServer+�� -   $- label��$��Enter siteserver��$��37��$��36.667,6.333,67.333,0q�$	��Top=��� -	   $��buttonpopOutOK��$��Connect��$��Bottom=�$��42,0,109,8.04q��� -
   $��buttonpopOutCancel��$��Cancel��$��Bottom=�$��0,0,18,8.04q�$��Right=�$��75���� -   $��label_MacAddress��
���   �#���  $��1q�2 J� RenderTransformOrigin$2 1.347,0.403&�$��0,3.667,14.624,5.605q�$��Right=�$��181.667������ *
MacAddress+$. PropertyChanged=����� *
StartStyle+���� # �  