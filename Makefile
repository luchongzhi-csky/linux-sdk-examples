##
 # Copyright 2017 C-SKY Microsystems Co., Ltd.
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 #   http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.
##

SUBDIRS := 	watchdog \
		fb \
		ffmpeg_audio_player \
		ffmpeg_media_player \
		spi_flash \
		v4l2_decode ffmpeg_media_player \
		storage \
		timer \
		pwm \
		network \
		rtc \
		v4l2_decode \
		ffmpeg_decode_audio \
		ffmpeg_demuxing \
		iis

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done

doc:
	for dir in $(SUBDIRS); do \
		pandoc $$dir/README.md -o $$dir/README.html; \
	done

.PHONY: all $(SUBDIRS) clean