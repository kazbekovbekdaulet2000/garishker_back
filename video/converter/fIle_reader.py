import os


class FileReader:
    def __init__(self, dir):
        self.dir = dir
        self.start_path = '/'.join(self.dir.split('/')[:-1])
        self.file_name = dir.split('/')[-1]
        self.name = os.path.splitext(self.file_name)[0]
        self.extension = os.path.splitext(self.file_name)[1]
    
    def quality_path(self, quality) -> str:
        return f"{self.start_path}/{self.name}_{quality}p{self.extension}"
    
    def quality_name(self, quality) -> str:
        return f"{self.name}_{quality}p{self.extension}"
    
    @property
    def bucker_dir_path(self) -> str: 
        return 'video-file'