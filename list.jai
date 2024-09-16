#import "Basic";
#import "File_Utilities";

Logical :: bool;

ListFilesSettings :: struct {}

main :: () {
	settings := ListFilesSettings.{};
	
	current_directory := get_working_directory();

	log("==========================================");
	visitor :: (info: *File_Visit_Info, settings: ListFilesSettings) {
		if info.had_error return;
		if info.is_directory {
			log("D %", info.short_name);
		} else if info.is_symlink {
			log("S %", info.short_name);
		} else {
			log("F %", info.short_name);
		}
	}
	visit_files(current_directory, false, settings, visitor, 
		visit_directories = true);
	log("==========================================");
}
