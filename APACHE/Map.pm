###############################################################################
## OCSINVENTORY-NG
## Copyleft Noé POIRIER 2022
## Web : http://www.ocsinventory-ng.org
##
## This code is open source and may be copied and modified as long as the source
## code is always made freely available.
## Please refer to the General Public Licence http://www.gnu.org/ or Licence.txt
################################################################################

package Apache::Ocsinventory::Plugins::Eventlogs::Map;
 
use strict;
 
use Apache::Ocsinventory::Map;
$DATA_MAP{eventlogs} = {
   mask => 0,
   multi => 1,
   auto => 1,
   delOnReplace => 1,
   sortBy => 'ID',
   writeDiff => 0,
   cache => 0,
   fields => {
       LOG_NAME => {},
       ENTRY_TYPE => {},
       EVENT_ID => {},
       MACHINE_NAME => {},
       SOURCE => {},
       TIME_GENERATED => {},
       TIME_WRITTEN => {},
       MESSAGE => {}
   }
};
1;
