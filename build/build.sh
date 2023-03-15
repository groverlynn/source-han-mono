#!/bin/bash

weights=(ExtraLight Light Normal Regular Medium Bold Heavy)
script_tags=(JP KR CN TW HK)
script_ids=(1 3 25 2 2)
locales=(J K SC TC HC)

## Command lines for building the source language-specific OTFs
## (replace $dir with the weight name)
##
## Executed in {ExtraLight,Light,Normal,Regular,Medium,Bold,Heavy}/OTC/

function build_lang_otfs() {
	for weight in ${weights[@]}; do
		for index in ${!script_tags[@]}; do
			tag=${script_tags[index]}
			sid=${script_ids[index]}
			loc=${locales[index]}
			locJ=${loc}
			if [ ${loc} = "J" ]; then
				locJ=""
			fi
			makeotf -f ../${weight}/OTC/cidfont.ps.OTC.${loc} -omitMacNames -ff ../${weight}/OTC/features.OTC.${loc} -fi ../${weight}/OTC/cidfontinfo.OTC.${loc} -mf ../FontMenuNameDB -r -nS -cs ${sid} -ch ../UniSourceHanMono${tag}-UTF32-H -ci ../SourceHanMono_${tag}_sequences.txt ; tx -cff +S ../${weight}/OTC/cidfont.ps.OTC.${loc} ../${weight}/OTC/CFF.OTC.${loc} ; sfntedit -a CFF=../${weight}/OTC/CFF.OTC.${loc} ../${weight}/OTC/SourceHanMono${locJ}-${weight}.otf
			makeotf -f ../${weight}/OTC/cidfont.ps.OTC.It.${loc} -omitMacNames -ff ../${weight}/OTC/features.OTC.It.${loc} -fi ../${weight}/OTC/cidfontinfo.OTC.It.${loc} -mf ../FontMenuNameDB -r -nS -cs ${sid} -ch ../UniSourceHanMonoIt${tag}-UTF32-H -ci ../SourceHanMono_${tag}_sequences_italic.txt ; tx -cff +S ../${weight}/OTC/cidfont.ps.OTC.It.${loc} ../${weight}/OTC/CFF.OTC.It.${loc} ; sfntedit -a CFF=../${weight}/OTC/CFF.OTC.It.${loc} ../${weight}/OTC/SourceHanMono${locJ}-${weight}It.otf
		done
		sfntedit -x CFF=CFF.${weight} -d DSIG SourceHanMono-${weight}.otf ; sfntedit -a CFF=CFF.${weight} -d DSIG SourceHanMonoK-${weight}.otf ; sfntedit -a CFF=CFF.${weight} -d DSIG SourceHanMonoSC-${weight}.otf ; sfntedit -a CFF=CFF.${weight} -d DSIG SourceHanMonoTC-${weight}.otf ; sfntedit -a CFF=CFF.${weight} -d DSIG SourceHanMonoHC-${weight}.otf ; sfntedit -a CFF=CFF.${weight} -d DSIG SourceHanMono-${weight}It.otf ; sfntedit -a CFF=CFF.${weight} -d DSIG SourceHanMonoK-${weight}It.otf ; sfntedit -a CFF=CFF.${weight} -d DSIG SourceHanMonoSC-${weight}It.otf ; sfntedit -a CFF=CFF.${weight} -d DSIG SourceHanMonoTC-${weight}It.otf ; sfntedit -a CFF=CFF.${weight} -d DSIG SourceHanMonoHC-${weight}It.otf
	done
}

build_lang_otfs

otf2otc -o SourceHanMono.ttc ../ExtraLight/OTC/SourceHanMonoSC-ExtraLight.otf ../ExtraLight/OTC/SourceHanMonoSC-ExtraLightIt.otf ../ExtraLight/OTC/SourceHanMonoTC-ExtraLight.otf ../ExtraLight/OTC/SourceHanMonoTC-ExtraLightIt.otf ../ExtraLight/OTC/SourceHanMonoHC-ExtraLight.otf ../ExtraLight/OTC/SourceHanMonoHC-ExtraLightIt.otf ../Light/OTC/SourceHanMonoSC-Light.otf ../Light/OTC/SourceHanMonoSC-LightIt.otf ../Light/OTC/SourceHanMonoTC-Light.otf ../Light/OTC/SourceHanMonoTC-LightIt.otf ../Light/OTC/SourceHanMonoHC-Light.otf ../Light/OTC/SourceHanMonoHC-LightIt.otf ../Normal/OTC/SourceHanMonoSC-Normal.otf ../Normal/OTC/SourceHanMonoSC-NormalIt.otf ../Normal/OTC/SourceHanMonoTC-Normal.otf ../Normal/OTC/SourceHanMonoTC-NormalIt.otf ../Normal/OTC/SourceHanMonoHC-Normal.otf ../Normal/OTC/SourceHanMonoHC-NormalIt.otf ../Regular/OTC/SourceHanMonoSC-Regular.otf ../Regular/OTC/SourceHanMonoSC-RegularIt.otf ../Regular/OTC/SourceHanMonoTC-Regular.otf ../Regular/OTC/SourceHanMonoTC-RegularIt.otf ../Regular/OTC/SourceHanMonoHC-Regular.otf ../Regular/OTC/SourceHanMonoHC-RegularIt.otf ../Medium/OTC/SourceHanMonoSC-Medium.otf ../Medium/OTC/SourceHanMonoSC-MediumIt.otf ../Medium/OTC/SourceHanMonoTC-Medium.otf ../Medium/OTC/SourceHanMonoTC-MediumIt.otf ../Medium/OTC/SourceHanMonoHC-Medium.otf ../Medium/OTC/SourceHanMonoHC-MediumIt.otf ../Bold/OTC/SourceHanMonoSC-Bold.otf ../Bold/OTC/SourceHanMonoSC-BoldIt.otf ../Bold/OTC/SourceHanMonoTC-Bold.otf ../Bold/OTC/SourceHanMonoTC-BoldIt.otf ../Bold/OTC/SourceHanMonoHC-Bold.otf ../Bold/OTC/SourceHanMonoHC-BoldIt.otf ../Heavy/OTC/SourceHanMonoSC-Heavy.otf ../Heavy/OTC/SourceHanMonoSC-HeavyIt.otf ../Heavy/OTC/SourceHanMonoTC-Heavy.otf ../Heavy/OTC/SourceHanMonoTC-HeavyIt.otf ../Heavy/OTC/SourceHanMonoHC-Heavy.otf ../Heavy/OTC/SourceHanMonoHC-HeavyIt.otf

otf2otc -o ourceHanMonoCJK.ttc ../ExtraLight/OTC/SourceHanMono-ExtraLight.otf ../ExtraLight/OTC/SourceHanMono-ExtraLightIt.otf ../ExtraLight/OTC/SourceHanMonoK-ExtraLight.otf ../ExtraLight/OTC/SourceHanMonoK-ExtraLightIt.otf ../ExtraLight/OTC/SourceHanMonoSC-ExtraLight.otf ../ExtraLight/OTC/SourceHanMonoSC-ExtraLightIt.otf ../ExtraLight/OTC/SourceHanMonoTC-ExtraLight.otf ../ExtraLight/OTC/SourceHanMonoTC-ExtraLightIt.otf ../ExtraLight/OTC/SourceHanMonoHC-ExtraLight.otf ../ExtraLight/OTC/SourceHanMonoHC-ExtraLightIt.otf ../Light/OTC/SourceHanMono-Light.otf ../Light/OTC/SourceHanMono-LightIt.otf ../Light/OTC/SourceHanMonoK-Light.otf ../Light/OTC/SourceHanMonoK-LightIt.otf ../Light/OTC/SourceHanMonoSC-Light.otf ../Light/OTC/SourceHanMonoSC-LightIt.otf ../Light/OTC/SourceHanMonoTC-Light.otf ../Light/OTC/SourceHanMonoTC-LightIt.otf ../Light/OTC/SourceHanMonoHC-Light.otf ../Light/OTC/SourceHanMonoHC-LightIt.otf ../Normal/OTC/SourceHanMono-Normal.otf ../Normal/OTC/SourceHanMono-NormalIt.otf ../Normal/OTC/SourceHanMonoK-Normal.otf ../Normal/OTC/SourceHanMonoK-NormalIt.otf ../Normal/OTC/SourceHanMonoSC-Normal.otf ../Normal/OTC/SourceHanMonoSC-NormalIt.otf ../Normal/OTC/SourceHanMonoTC-Normal.otf ../Normal/OTC/SourceHanMonoTC-NormalIt.otf ../Normal/OTC/SourceHanMonoHC-Normal.otf ../Normal/OTC/SourceHanMonoHC-NormalIt.otf ../Regular/OTC/SourceHanMono-Regular.otf ../Regular/OTC/SourceHanMono-RegularIt.otf ../Regular/OTC/SourceHanMonoK-Regular.otf ../Regular/OTC/SourceHanMonoK-RegularIt.otf ../Regular/OTC/SourceHanMonoSC-Regular.otf ../Regular/OTC/SourceHanMonoSC-RegularIt.otf ../Regular/OTC/SourceHanMonoTC-Regular.otf ../Regular/OTC/SourceHanMonoTC-RegularIt.otf ../Regular/OTC/SourceHanMonoHC-Regular.otf ../Regular/OTC/SourceHanMonoHC-RegularIt.otf ../Medium/OTC/SourceHanMono-Medium.otf ../Medium/OTC/SourceHanMono-MediumIt.otf ../Medium/OTC/SourceHanMonoK-Medium.otf ../Medium/OTC/SourceHanMonoK-MediumIt.otf ../Medium/OTC/SourceHanMonoSC-Medium.otf ../Medium/OTC/SourceHanMonoSC-MediumIt.otf ../Medium/OTC/SourceHanMonoTC-Medium.otf ../Medium/OTC/SourceHanMonoTC-MediumIt.otf ../Medium/OTC/SourceHanMonoHC-Medium.otf ../Medium/OTC/SourceHanMonoHC-MediumIt.otf ../Bold/OTC/SourceHanMono-Bold.otf ../Bold/OTC/SourceHanMono-BoldIt.otf ../Bold/OTC/SourceHanMonoK-Bold.otf ../Bold/OTC/SourceHanMonoK-BoldIt.otf ../Bold/OTC/SourceHanMonoSC-Bold.otf ../Bold/OTC/SourceHanMonoSC-BoldIt.otf ../Bold/OTC/SourceHanMonoTC-Bold.otf ../Bold/OTC/SourceHanMonoTC-BoldIt.otf ../Bold/OTC/SourceHanMonoHC-Bold.otf ../Bold/OTC/SourceHanMonoHC-BoldIt.otf ../Heavy/OTC/SourceHanMono-Heavy.otf ../Heavy/OTC/SourceHanMono-HeavyIt.otf ../Heavy/OTC/SourceHanMonoK-Heavy.otf ../Heavy/OTC/SourceHanMonoK-HeavyIt.otf ../Heavy/OTC/SourceHanMonoSC-Heavy.otf ../Heavy/OTC/SourceHanMonoSC-HeavyIt.otf ../Heavy/OTC/SourceHanMonoTC-Heavy.otf ../Heavy/OTC/SourceHanMonoTC-HeavyIt.otf ../Heavy/OTC/SourceHanMonoHC-Heavy.otf ../Heavy/OTC/SourceHanMonoHC-HeavyIt.otf

# EOF
