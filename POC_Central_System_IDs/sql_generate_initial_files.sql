SELECT 'echo ' || currentnextsys || ' > ' || NAME || '.seq'
  FROM AD_SEQUENCE
 WHERE istableid = 'Y'