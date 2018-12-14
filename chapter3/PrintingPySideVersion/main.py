# PySideバインディングに使用したQtのバーション表示の為に、
# PySide2.QtCoreをimport
import PySide2.QtCore


# PySide2 Versionの表示
print('PySide2 version : {0}'.format(PySide2.__version__))

# PySideバインディングに使用したQtのバーション表示
print('Qt version used to compile PySide2 : {0}'
      .format(PySide2.QtCore.__version__))
