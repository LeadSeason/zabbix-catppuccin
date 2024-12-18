USE zabbix;
  
INSERT INTO graph_theme (
  graphthemeid, theme, backgroundcolor, 
  graphcolor, gridcolor, maingridcolor, 
  gridbordercolor, textcolor, highlightcolor, 
  leftpercentilecolor, rightpercentilecolor, 
  nonworktimecolor, colorpalette
) 
VALUES 
  (
    5, 'catppuccin-mocha', '1e1e2e', '1e1e2e', 
    '45475a', '585b70', '585b70', 'cdd6f4', 
    'f38ba8', 'a6e3a1', 'f38ba8', '313244', 
    'a6e3a1,eba0ac,74c7ec,fab387,eba0ac,cba6f7,f9e2af,74c7ec,f5c2e7,b4befe,94e2d5,f2cdcd,89ABF8,7EC25C,3165D5,79A277,AA73DE,FD5434,F21C3E,87AC4D,E89DF4'
  );
