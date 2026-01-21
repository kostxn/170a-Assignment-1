import pandas as pd

def find_duplicate_names(filepath):
    """
    Find and display duplicate names in a single CSV file.
    
    Args:
        filepath: Path to the CSV file
    """
    print(f"Processing: {filepath}")
    print("=" * 60)
    
    try:
        df = pd.read_csv(filepath, encoding='utf-8')
        
        print(f"Total rows: {len(df)}\n")
        
        # Check each column for duplicates
        for column in df.columns:
            duplicates = df[column][df[column].duplicated(keep=False)]
            
            if len(duplicates) > 0:
                print(f"\nColumn: {column}")
                print("-" * 40)
                
                duplicate_counts = duplicates.value_counts().sort_values(ascending=False)
                
                print(f"Total duplicate entries: {len(duplicates)}")
                print(f"Unique duplicated values: {len(duplicate_counts)}\n")
                
                for value, count in duplicate_counts.items():
                    print(f"  '{value}' appears {count} times")
            else:
                print(f"\nColumn: {column} - No duplicates ✓")
        
    except FileNotFoundError:
        print(f"Error: File '{filepath}' not found!")
    except Exception as e:
        print(f"Error processing file: {e}")


if __name__ == "__main__":
    # Option 1: Hardcode the filepath
    filepath = "C:\\Users\\kjmal\\170a\\A1\\A1_CSVs\\conference_ranking.csv"
    
    # Option 2: Ask user for filepath
    # filepath = input("Enter path to CSV file: ")
    
    find_duplicate_names(filepath)