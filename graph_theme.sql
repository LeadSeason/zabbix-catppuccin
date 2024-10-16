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
    '199C0D,F63100,2774A4,F7941D,FC6EA3,6C59DC,C7A72D,BA2A5D,F230E0,5CCD18,BB2A02,AC41A5,89ABF8,7EC25C,3165D5,79A277,AA73DE,FD5434,F21C3E,87AC4D,E89DF4'
  );
