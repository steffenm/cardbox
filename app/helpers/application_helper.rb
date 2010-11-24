module ApplicationHelper
  def link_to_edit(path)
    link_to(image_tag('icons/019.png',:heigth=>'16',:width=>'16',:title=>_('bearbeiten'),:alt=>_('bearbeiten')), path)
  end
  def link_to_details(path)
    link_to(image_tag('icons/049.png',:heigth=>'16',:width=>'16',:title=>_('details'),:alt=>_('details')), path)
  end
  def link_to_delete(path)
    link_to(image_tag('icons/101.png',:heigth=>'16',:width=>'16',:title=>_('löschen'),:alt=>_('löschen')), path, :confirm => _('Bist Du sicher?'), :method => :delete)
  end
  def link_to_new(path,alt=nil)
    link_to(image_tag('icons/103.png',:heigth=>'16',:width=>'16',:title=> alt || _('Neue Karte'),:alt=> alt || _('Neue Karte')), path)    
  end
  def link_to_back(path,alt=nil)
    link_to(image_tag('icons/106.png',:heigth=>'16',:width=>'16',:title=> alt || _('zurück'),:alt=> alt || _('zurück')), path)
  end
end
