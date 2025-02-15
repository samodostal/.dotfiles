stow:
	@for dir in `ls -d */`; do \
		parsed_dir="${dir%/}"; \
		if [[ ! " ${ignore_list[*]} " =~ " ${parsed_dir} " ]]; then \
			echo "Stow-ing: ${parsed_dir}"; \
			stow ${parsed_dir}; \
		fi; \
	done

unstow:
	stow --delete */
