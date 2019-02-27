sudo ./configure \
--enable-pythoninterp \
--with-features=huge \
--with-x \
--disable-darwin \
--enable-fail-if-missing && \
sudo make && \
sudo make install
