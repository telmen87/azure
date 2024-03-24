-- insert values
Begin 
    insert into metric(MetricName, Unit) VALUES
    ('Rate (Mt.EFH Km)', 'Mt.EFH Km'),
    ('Utility (%)', '%'),
    ('Coal Dry Mining (Mt)', 'Mt'),
    ('Coal Mined (Mt)', 'Mt'),
    ('Yield (%)', '%'),
    ('Drills per Hour (TOH)', 'TOH')
End


BEGIN
    insert into entity(entityname) values
    ('Geomining Innovations'),
    ('Mineral Extraction Technologies'),
    ('Deep Earth Exploration Unit'),
    ('ACME'),
    ('Pacific Surface Mining Solutions'),
    ('Core Extraction Systems'),
    ('Quarrying Ventures'),
    ('Rock Solid Enterprises'),
    ('Drill & Blast Division'),
    ('Deep Earth'),
    ('Deep Earth Unit')
END
