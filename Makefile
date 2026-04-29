CXX = g++
CXXFLAGS = -std=c++17 -Wall -pthread
TARGET = wifihack
SOURCE = main.cpp

# Определяем домашнюю директорию пользователя
HOME_DIR = $(shell echo $$HOME)
# Полный путь к папке проекта
PROJECT_DIR = $(HOME_DIR)/Automated-WPA2-Handshake-Cracking-Script

all:
	$(CXX) $(CXXFLAGS) -o $(PROJECT_DIR)/$(TARGET) $(SOURCE)

# Очистка — удаляем скомпилированный файл
clean:
	rm -f $(PROJECT_DIR)/$(TARGET)

# Установка в систему
install: all
	sudo cp $(PROJECT_DIR)/$(TARGET) /usr/local/bin/

# Запуск (сначала компилируем)
run: all
	sudo $(PROJECT_DIR)/$(TARGET)

# Быстрая компиляция в текущей папке
local:
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SOURCE)

help:
	@echo "make        - скомпилировать в папку проекта"
	@echo "make clean  - удалить скомпилированный файл"
	@echo "make run    - скомпилировать и запустить"
	@echo "make install - установить в систему"
	@echo "make local  - скомпилировать в текущей папке"
