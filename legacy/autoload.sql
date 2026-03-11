
EXEC ('
CREATE PROCEDURE DB.DBA.AUTO_RDF_LOAD()
{
  log_enable(2);
  ld_dir(''/rdf'', ''*.ttl'', ''http://example.org'');
  rdf_loader_run();
}
');

-- CREATE PROCEDURE DB.DBA.AUTO_RDF_LOAD ()
-- {
--   log_enable(2)  ;
--   ld_dir('/rdf', '*.ttl', 'http://example.org')  ;
--   rdf_loader_run()  ;
-- }
-- ;


DELETE FROM DB.DBA.SYS_SCHEDULED_EVENT WHERE SE_NAME = 'AUTO_RDF_LOAD_EVENT';


INSERT INTO DB.DBA.SYS_SCHEDULED_EVENT (SE_NAME, SE_START, SE_SQL, SE_INTERVAL)
VALUES ('AUTO_RDF_LOAD_EVENT', NOW(), 'DB.DBA.AUTO_RDF_LOAD()', 1);



