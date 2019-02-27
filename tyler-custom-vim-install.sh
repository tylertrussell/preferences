sudo make distclean
sudo ./configure \
--enable-pythoninterp \
--with-python-config-dir=$(pyenv root)/shims/python \
--with-features=huge \
--with-x \
--disable-darwin \
--enable-fail-if-missing && \
sudo make && \
sudo make install
