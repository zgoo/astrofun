> 这是一个对solve-field 命令的解读说明

- #### 原始帮助信息
  `$ solve-field -h` : 
  ```
  This program is part of the Astrometry.net suite.
  For details, visit http://astrometry.net.
  Git URL https://github.com/dstndstn/astrometry.net
  Revision 0.73, date Thu_Nov_16_08:30:44_2017_-0500.
  
  Usage:   solve-field [options]  [<image-file-1> <image-file-2> ...] [<xyls-file-1> <xyls-file-2>    ...]
  
  You can specify http:// or ftp:// URLs instead of filenames.  The "wget" or "curl" program will    be used to retrieve the URL.
  
  Options include:
    -h / --help: print this help message
    -v / --verbose: be more chatty -- repeat for even more verboseness
    -D / --dir <directory>: place all output files in the specified directory
    -o / --out <base-filename>: name the output files with this base name
    -b / --backend-config <filename>: use this config file for the
            "astrometry-engine" program
    --config <filename>: use this config file for the "astrometry-engine" program
    --batch: run astrometry-engine once, rather than once per input file
    -f / --files-on-stdin: read filenames to solve on stdin, one per line
    -p / --no-plots: don't create any plots of the results
    --plot-scale <scale>: scale the plots by this factor (eg, 0.25)
    --plot-bg <filename (JPEG)>: set the background image to use for plots
    -G / --use-wget: use wget instead of curl
    -O / --overwrite: overwrite output files if they already exist
    -K / --continue: don't overwrite output files if they already exist; continue
            a previous run
    -J / --skip-solved: skip input files for which the 'solved' output file
            already exists; NOTE: this assumes single-field input files
    --fits-image: assume the input files are FITS images
    -N / --new-fits <filename>: output filename of the new FITS file containing
            the WCS header; "none" to not create this file
    -Z / --kmz <filename>: create KMZ file for Google Sky.  (requires wcs2kml)
    -i / --scamp <filename>: create image object catalog for SCAMP
    -n / --scamp-config <filename>: create SCAMP config file snippet
    -U / --index-xyls <filename>: output filename for xylist containing the image
            coordinate of stars from the index
    --just-augment: just write the augmented xylist files; don't run
            astrometry-engine.
    --axy <filename>: output filename for augment xy list (axy)
    --temp-axy: write 'augmented xy list' (axy) file to a temp file
    --timestamp: add timestamps to log messages
    -7 / --no-delete-temp: don't delete temp files (for debugging)
    -L / --scale-low <scale>: lower bound of image scale estimate
    -H / --scale-high <scale>: upper bound of image scale estimate
    -u / --scale-units <units>: in what units are the lower and upper bounds?
       choices:  "degwidth", "degw", "dw"   : width of the image, in degrees (default)
                 "arcminwidth", "amw", "aw" : width of the image, in arcminutes
                 "arcsecperpix", "app": arcseconds per pixel
                 "focalmm": 35-mm (width-based) equivalent focal length
    -8 / --parity <pos/neg>: only check for matches with positive/negative parity
            (default: try both)
    -c / --code-tolerance <distance>: matching distance for quads (default: 0.01)
    -E / --pixel-error <pixels>: for verification, size of pixel positional error
            (default: 1)
    -q / --quad-size-min <fraction>: minimum size of quads to try, as a fraction
            of the smaller image dimension, default: 0.1
    -Q / --quad-size-max <fraction>: maximum size of quads to try, as a fraction
            of the image hypotenuse, default 1.0
    --odds-to-tune-up <odds>: odds ratio at which to try tuning up a match that
            isn't good enough to solve (default: 1e6)
    --odds-to-solve <odds>: odds ratio at which to consider a field solved
            (default: 1e9)
    --odds-to-reject <odds>: odds ratio at which to reject a hypothesis (default:
            1e-100)
    --odds-to-stop-looking <odds>: odds ratio at which to stop adding stars when
            evaluating a hypothesis (default: HUGE_VAL)
    --use-sextractor: use SExtractor rather than built-in image2xy to find sources
    --sextractor-config <filename>: use the given SExtractor config file.  Note
            that CATALOG_NAME and CATALOG_TYPE values will be over-ridden by
            command-line values.  This option implies --use-sextractor.
    --sextractor-path <filename>: use the given path to the SExtractor executable.
            Default: just 'sex', assumed to be in your PATH.  Note that you can
            give command-line args here too (but put them in quotes), eg:
            --sextractor-path 'sex -DETECT_TYPE CCD'.  This option implies
            --use-sextractor.
    -3 / --ra <degrees or hh:mm:ss>: only search in indexes within 'radius' of the
            field center given by 'ra' and 'dec'
    -4 / --dec <degrees or [+-]dd:mm:ss>: only search in indexes within 'radius'
            of the field center given by 'ra' and 'dec'
    -5 / --radius <degrees>: only search in indexes within 'radius' of the field
            center given by ('ra', 'dec')
    -d / --depth <number or range>: number of field objects to look at, or range
            of numbers; 1 is the brightest star, so "-d 10" or "-d 1-10" mean look
            at the top ten brightest stars only.
    --objs <int>: cut the source list to have this many items (after sorting, if
            applicable).
    -l / --cpulimit <seconds>: give up solving after the specified number of
            seconds of CPU time
    -r / --resort: sort the star brightnesses by background-subtracted flux; the
            default is to sort using acompromise between background-subtracted and
            non-background-subtracted flux
    -6 / --extension <int>: FITS extension to read image from.
    --invert: invert the image (for black-on-white images)
    -z / --downsample <int>: downsample the image by factor <int> before running
            source extraction
    --no-background-subtraction: don't try to estimate a smoothly-varying sky
            background during source extraction.
    --sigma <float>: set the noise level in the image
    --nsigma <float>: number of sigma for a source detection; default 8
    -9 / --no-remove-lines: don't remove horizontal and vertical overdensities of
            sources.
    --uniformize <int>: select sources uniformly using roughly this many boxes
            (0=disable; default 10)
    --no-verify-uniformize: don't uniformize the field stars during verification
    --no-verify-dedup: don't deduplicate the field stars during verification
    -C / --cancel <filename>: filename whose creation signals the process to stop
    -S / --solved <filename>: output file to mark that the solver succeeded
    -I / --solved-in <filename>: input filename for solved file
    -M / --match <filename>: output filename for match file
    -R / --rdls <filename>: output filename for RDLS file
    --sort-rdls <column>: sort the RDLS file by this column; default is ascending;
            use "-column" to sort "column" in descending order instead.
    --tag <column>: grab tag-along column from index into RDLS file
    --tag-all: grab all tag-along columns from index into RDLS file
    -j / --scamp-ref <filename>: output filename for SCAMP reference catalog
    -B / --corr <filename>: output filename for correspondences
    -W / --wcs <filename>: output filename for WCS file
    -P / --pnm <filename>: save the PNM file as <filename>
    -k / --keep-xylist <filename>: save the (unaugmented) xylist to <filename>
    -A / --dont-augment: quit after writing the unaugmented xylist
    -V / --verify <filename>: try to verify an existing WCS file
    --verify-ext <extension>: HDU from which to read WCS to verify; set this
            BEFORE --verify
    -y / --no-verify: ignore existing WCS headers in FITS input images
    -g / --guess-scale: try to guess the image scale from the FITS headers
    --crpix-center: set the WCS reference point to the image center
    --crpix-x <pix>: set the WCS reference point to the given position
    --crpix-y <pix>: set the WCS reference point to the given position
    -T / --no-tweak: don't fine-tune WCS by computing a SIP polynomial
    -t / --tweak-order <int>: polynomial order of SIP WCS corrections
    -m / --temp-dir <dir>: where to put temp files, default /tmp
  The following options are valid for xylist inputs only:
    -F / --fields <number or range>: the FITS extension(s) to solve, inclusive
    -w / --width <pixels>: specify the field width
    -e / --height <pixels>: specify the field height
    -X / --x-column <column-name>: the FITS column containing the X coordinate of
            the sources
    -Y / --y-column <column-name>: the FITS column containing the Y coordinate of
            the sources
    -s / --sort-column <column-name>: the FITS column that should be used to sort
            the sources
    -a / --sort-ascending: sort in ascending order (smallest first); default is
            descending order
  
  Note that most output files can be disabled by setting the filename to "none".
   (If you have a sick sense of humour and you really want to name your output
    file "none", you can use "./none" instead.)
  ```

===============================================================================
- #### 解读
  - `--verbose`, `-v`, `-vv` 打印处理过程详情、更多详情，常用于调试；
  - `--dir`, `-D` 处理过程中的各类输出文档路径定义，如果不指定，将使用和待处理图片相同的路径；
  建议不管是开发还是生产环境，都放到独立于图片路径的其他路径；
  - `--out`, `-o` 处理过程中各类输出文档的前缀，大概可以用于：不同的命令调用者（用户或程序）处理同一张（批）图片时进行区分；
  - `--backend-config`, `-b`, `--config` 指定默认 `etc/astrometry.cfg` 文件的路径为新的路径，常用于对比测试或者不同硬件环境下；
  - `--batch` 批处理，当一次命令调用处理多个文件时，使用一次性运行*astrometry-engine*，而非一个文件一次；
  - `--files-on-stdin`, `-f` 交互式运行程序，从console读取用户输入的文件名进行处理，一次只读取一个；个人觉得，没啥必要，路径没法tab自动索引，容易输错；
  - `--no-plots`, `-p` 处理过程会生成？个绘制信息的图片文件，使用此参数将不再创建这类图片，常用于生产环境；
  - `--plot-scale` 拉伸绘制形状大小，使用一个因数>0，乘积关系；
  - `--plot-bg` 设置绘制图像时候的背景图层，一般使用纯色，为了方便对比，只能使用jpeg格式的图片；
  - `--use-wget`, `-G` 在使用非本地文件（http/ftp，https 可能为因为ssl认证问题而不成功）运行程序时，使用 `wget`下载文件而非 `curl`；
  - `--overwrite`, `-O` 在多次重复处理同一张图片时，覆盖上一次生成的所有输出文件；
  - `--continue`, `-K` 在多次重复处理同一张图片时，不再覆盖上一次生成的所有输出文件，而是“接着运行”——使用上次的输出文件；
  - `--skip-solved`, `-J` 在批量处理过程中，跳过处理已经有`.solved`输出文件的文件；NOTE: this assumes single-field input files；
  - `--fits-image` 假设待处理的文件是 FITs 图像，这么做，可以节省程序判定输入文件是何种类型的消耗；
  - `--new-fits`, `-N` 设置输出文件 *new FITs* 的文件名，该文件包含已经解析后的WCS头信息； 设置为 *none* 表示不再输出该文件；
  - `--kmz`, `-Z` 创建适用于 Sky in Google Earth 的KMZ文件，需要安装 wcs2kml （`https://code.google.com/archive/p/wcs2kml/`）；
  - `--scamp`, `-i` 创建可用于 SCAMP（`https://www.astromatic.net/software/scamp`）读取影射目录图像；
  - `--scamp-config`, `-n` 创建SCAMP配置文件片段；
  - `--index-xyls`, `-U` 设置从 index 文件中读取的 包含星点坐标的 xylist 图像文件名；
  - `--just-augment` 仅仅创建xylist文件，而不运行astrometry-engine；作为分析时采取的措施；
  - `--axy` 设置输出文档`.axy`（augment xy list）的文件名；
  - `--temp-axy` 将`.axy`文件写为一个 temp 文件；
  - `--timestamp` 打印程序处理过程的 进程ID和使用时间，精确到毫秒，例如： `12312 2.023`;
  - `--no-delete-temp`, `-7` 程序处理过程中默认会生成许多的tmp文件，并在使用完成后做清除处理，该设置将不再删除此类tmp文件；调试时这么做，否则请在进程完成后手动删除，避免文件累积占用磁盘空间；
  - `--scale-low`, `-L` 待处理图像所包含天区的视角最小值；
  - `--scale-high`, `-H` 待处理图像所包含天区的视角最大值；
  - `--scale-units`, `-u` 待处理图像所包含天区的视角表达单位，配合上面2个参数使用；包括：   
  degwidth - degw - dw : 默认值，图片宽度，角度表示；   
  arcminwidth - amw - aw : 图片宽度，角分表示；   
  arcsecperpix - app : 每像素多少角秒；   
  focalmm : 1 focalmm == 35mm（基于宽度）；
  - `--parity`, `-7` 取值： <pos/neg>，设置只检测 正向或者负向匹配值，默认2者都检测；
  - `--code-tolerance`, `-c` 匹配 星点四边形 之间的距离，默认值 0.01；
  - `--pixel-error`, `-E` 校验时使用，像素位置误差的大小，默认值 1；
  - `--quad-size-min`, `-q` 星点匹配过程中，星点四边形 的占图像的最小尺寸，分数表示，默认值 0.1（1/10）；
  - `--quad-size-max`, `-Q` 星点匹配过程中，星点四边形 的占图像的最小尺寸，分数表示，默认值 1（1）；
  - `--odds-to-tune-up` odds ratio at which to try tuning up a match that isn't good enough to solve (default: 1e6)
  - `--odds-to-solve` odds ratio at which to consider a field solved (default: 1e9)
  - `--odds-to-reject` odds ratio at which to reject a hypothesis (default: 1e-100)
  - `--odds-to-stop-looking` odds ratio at which to stop adding stars when evaluating a hypothesis (default: HUGE_VAL)
  - `--use-sextractor` 使用 SExtractor（`https://www.astromatic.net/software/sextractor`） 而不是内建的 image2xy 进行图像星点搜索；
  - `--sextractor-path` 设置 SExtractor 可执行文件的路径；默认值为 `sex`，假定已经安装到了 PATH。可以复合使用 sex的命令，例如 `--sextractor-path 'sex -DETECT_TYPE CCD'`，注意 引号，设置sex参数后，将意味着等同于设置了 `--use-sextractor`;
  - `--ra`, `-3` 使用 <degrees or hh:mm:ss>；给定该值（& dec）后，将只在`--radius`的值给定的半径范围所映射的索引文件（indexs files）中进行搜索；
  - `--dec`, `-4` 使用 <degrees or [+-]dd:mm:ss>；给定该值（ra &）后，将只在`--radius`的值给定的半径范围所映射的索引文件（indexs files）中进行搜索；
  - `--radius`, `-5` 配合上面2个值（ra & dec）试用；
  - `--depth`, `-d` 星点搜索深度。图像解析后，按照星点亮度（最亮到最暗）从1开始排列，默认10个一组；可设置格式有： `-d 5-10` `-d 10,20,30` `-d 1-20`；
  - `--objs` cut the source list to have this many items (after sorting, if applicable)
  - `--cpulimit`, `-l` 设置程序在开始解析过程后CPU的限制时间，单位为秒；
  - `--resort`, `-r` 通过扣除背景的量重新对星等亮度进行排序；默认是使用背景扣除和非背景扣除的通量之间的平均值进行排序；
  - `--extension`, `-6` FITs 扩展，以便读取文件？？？
  - `--invert` 反转图像黑白色，仅仅对于 基于白色的黑色图像；
  - `--downsample`, `-z` 降低采样，正整数，最佳实践 2 or 4。该过程发生在星点解析（soruce extraction）之前；
  - `--no-background-subtraction` 在源提取（星点解析）过程中不在尝试估算出天空背景的平滑变化；
  - `--sigma` 设置图像的噪声等级，浮点数；
  - `--nsigma` 在源提取过程中使用的sigma数量，默认值 8；
  - `--no-remove-lines`, `-9` 设置该参数，将不再移除源的水平和垂直密度？？？。
  - `--uniformize` 均匀地使用大致 多少个 框 进行 源选择；0 - disable； 默认值 10；
  - `--no-verify-uniformize` 在校验过程中，不再图像上的某区域星点进行均匀化；
  - `--no-verify-dedup` 在验证过程中不要重复删除图像上的某区域星点;
  - `--cancel`, `-C` filename whose creation signals the process to stop
  - `--solved`, `-S` 设置解析成功后的输出文档`.solved`的文件名；
  - `--solved-in`, `-I` input filename for solved file ？？？
  - `--match`, `-M` 设置输出文档`.match`的文件名；
  - `--rdls`, `-R` 设置输出文档`.rdls`的文件名；
  - `--sort-rdls` sort the RDLS file by this column; default is ascending;
  use "-column" to sort "column" in descending order instead.
  - `--tag` 从索引提取tag到RDLS文件；
  - `--tag-all` 从索引提取所有tag到RDLS文件；
  - `--scamp-ref`, `-j` 设置SCAMP指引目录输出文档的文件名；
  - `--corr`, `-B` 设置对应关系文档的文件名；
  - `--wcs`, `-W` 设置输出文档`.wcs`的文件名；
  - `--pnm`, `-P` 设置 <filename>； 将 PNM 文件保存为 <filename>；
  - `--keep-xylist`, `-k` 设置 <filename>； 将 unaugmented 的 xylist 保存为 <filename>；
  - `--dont-augment`, `-A` 写完 unaugmented xylist 文件后退出处理进程；
  - `--verify`, `-V` 尝试验证已经存在的 WCS 文件；
  - `--verify-ext` HDU from which to read WCS to verify; set this
            BEFORE --verify
  - `--no-verify`, `-y` 忽略待解析的FITs图像文件的 WCS 头信息；
  - `--guess-scale`, `-g` 尝试从FITs图像的头信息中估算图像的拉伸大小；
  - `--crpix-center` 将WCS指向点设置到图像的中央；
  - `--crpix-x` 将WCS指向点设置到图像的指定的位置 - x向；
  - `--crpix-y` 将WCS指向点设置到图像的指定的位置 - y向；
  - `--no-tweak`, `-T` don't fine-tune WCS by computing a SIP polynomial
  - `--tweak-order`, `-t`  polynomial order of SIP WCS corrections
  - `--temp-dir`, `-m` 程序处理过程总，生成tmp文件放置的目录，默认是 `/tmp`

  - 仅仅对输入文件是 xylist （`.axy`）的有效：
    - -F / --fields <number or range>: the FITS extension(s) to solve, inclusive
    - -w / --width <pixels>: specify the field width
    - -e / --height <pixels>: specify the field height
    - -X / --x-column <column-name>: the FITS column containing the X coordinate of
            the sources
    - -Y / --y-column <column-name>: the FITS column containing the Y coordinate of
            the sources
    - -s / --sort-column <column-name>: the FITS column that should be used to sort
            the sources
    - -a / --sort-ascending: sort in ascending order (smallest first); default is
            descending order
