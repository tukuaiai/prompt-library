# ==============================================================================
# 通用 Makefile 模板 (Generic Makefile Template)
#
# 使用方法:
# 1. 修改 PYTHON 变量以匹配你的 Python 解释器 (python, python3)。
# 2. 如果你的主脚本不是 'main.py', 请修改 'run' 目标中的脚本名称。
# ==============================================================================

# 设置 Python 解释器 (可修改)
PYTHON = python3

# --- 标准目标 ---

# 默认目标，显示帮助信息
.PHONY: help
help:
	@echo "Makefile for Prompt Library"
	@echo ""
	@echo "Usage:"
	@echo "    make install    - 安装所有依赖"
	@echo "    make run        - 运行主脚本"
	@echo "    make clean      - 清理生成的文件和缓存"
	@echo ""

# 安装依赖
# 依赖于 requirements.txt 文件
.PHONY: install
install:
	$(PYTHON) -m pip install -r requirements.txt
	@echo "Dependencies installed successfully."

# 运行主脚本 (可修改脚本名称)
.PHONY: run
run:
	$(PYTHON) main.py

# 清理生成的文件和缓存 (可根据项目产出修改)
.PHONY: clean
clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	@echo "Cleaned generated files and Python cache."

# 防止将文件名误认为目标
.PHONY: help install run clean
